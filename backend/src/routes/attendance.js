// src/routes/attendance.js
// FIX NOTES:
// - db.js has timezone: '+08:00' which sets MySQL session TZ to PH time.
//   So NOW() stores PH time, and DATE(timestamp) extracts PH date correctly.
//   DO NOT use CONVERT_TZ — that would double-offset to +16:00.
// - The only JS-side fix needed: replace new Date().toISOString().split('T')[0]
//   (which returns UTC date) with getPHToday() (which returns PH date).

const express         = require('express');
const db              = require('../config/db');
const { verifyToken } = require('../middleware/auth');

const router = express.Router();

// Returns today's date as "YYYY-MM-DD" in PH time (Asia/Manila / UTC+8).
// en-CA locale produces YYYY-MM-DD format that MySQL DATE() expects.
const getPHToday = () =>
  new Date().toLocaleDateString('en-CA', { timeZone: 'Asia/Manila' });

// -------------------------------------------------------
// POST /api/attendance/log
// -------------------------------------------------------
router.post('/log', async (req, res) => {
  const { student_id, student_name, status, task_accomplishment, is_overtime } = req.body;

  if (!student_id || !student_name || !status) {
    return res.status(400).json({ success: false, message: 'student_id, student_name, and status are required.' });
  }
  if (!['Time In', 'Time Out'].includes(status)) {
    return res.status(400).json({ success: false, message: 'Status must be "Time In" or "Time Out".' });
  }

  try {
    const today = getPHToday(); // ✅ PH date, not UTC

    if (status === 'Time In') {
      const [existing] = await db.query(
        `SELECT id FROM attendance_logs
         WHERE student_id = ? AND status = 'Time In'
         AND DATE(timestamp) = ? LIMIT 1`,
        [student_id, today]
      );
      if (existing.length > 0) {
        return res.status(409).json({ success: false, message: 'ALREADY TIMED IN: You can only Time In once per day.' });
      }
    }

    if (status === 'Time Out') {
      const [timeInRecord] = await db.query(
        `SELECT id FROM attendance_logs
         WHERE student_id = ? AND status = 'Time In'
         AND DATE(timestamp) = ? LIMIT 1`,
        [student_id, today]
      );
      if (timeInRecord.length === 0) {
        return res.status(409).json({ success: false, message: 'ACTION DENIED: You must Time In first.' });
      }

      const [existingOut] = await db.query(
        `SELECT id FROM attendance_logs
         WHERE student_id = ? AND status = 'Time Out'
         AND DATE(timestamp) = ? LIMIT 1`,
        [student_id, today]
      );
      if (existingOut.length > 0) {
        return res.status(409).json({ success: false, message: 'ALREADY COMPLETED: You have already Timed Out for today.' });
      }
    }

    const taskValue = status === 'Time In'
      ? 'Ongoing...'
      : (task_accomplishment?.trim() || 'No task reported');

    let overtimeValue = 0;
    if (status === 'Time In') {
      overtimeValue = is_overtime ? 1 : 0;
    } else {
      const [timeInRow] = await db.query(
        `SELECT is_overtime FROM attendance_logs
         WHERE student_id = ? AND status = 'Time In'
         AND DATE(timestamp) = ? LIMIT 1`,
        [student_id, today]
      );
      overtimeValue = timeInRow[0]?.is_overtime || 0;
    }

    const [result] = await db.query(
      `INSERT INTO attendance_logs (student_id, student_name, status, task_accomplishment, is_overtime, timestamp)
       VALUES (?, ?, ?, ?, ?, NOW())`,
      [student_id, student_name, status, taskValue, overtimeValue]
    );

    const [newRecord] = await db.query('SELECT * FROM attendance_logs WHERE id = ?', [result.insertId]);

    res.status(201).json({ success: true, message: `${status} recorded successfully.`, record: newRecord[0] });

  } catch (err) {
    console.error('Attendance log error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

// -------------------------------------------------------
// GET /api/attendance/status/:student_id
// -------------------------------------------------------
router.get('/status/:student_id', async (req, res) => {
  const { student_id } = req.params;
  const today = getPHToday(); // ✅ PH date

  try {
    const [logs] = await db.query(
      `SELECT status, is_overtime FROM attendance_logs
       WHERE student_id = ? AND DATE(timestamp) = ?
       ORDER BY timestamp ASC`,
      [student_id, today]
    );

    let attendanceStatus = 'none';
    let is_overtime      = false;
    const statuses       = logs.map(l => l.status);

    if (statuses.includes('Time In') && statuses.includes('Time Out')) {
      attendanceStatus = 'completed';
    } else if (statuses.includes('Time In')) {
      attendanceStatus = 'timed-in';
    }

    const timeInLog = logs.find(l => l.status === 'Time In');
    if (timeInLog) is_overtime = timeInLog.is_overtime === 1;

    res.json({ success: true, status: attendanceStatus, is_overtime });

  } catch (err) {
    console.error('Status check error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

// -------------------------------------------------------
// GET /api/attendance/all  (Admin only)
// -------------------------------------------------------
router.get('/all', verifyToken, async (req, res) => {
  try {
    const [records] = await db.query(
      `SELECT * FROM attendance_logs ORDER BY timestamp DESC`
    );
    res.json({ success: true, records });
  } catch (err) {
    console.error('Fetch all error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

// -------------------------------------------------------
// GET /api/attendance/summary  (Admin only)
// -------------------------------------------------------
router.get('/summary', verifyToken, async (req, res) => {
  const { student_id, month } = req.query;
  try {
    let query    = `SELECT * FROM v_daily_attendance WHERE 1=1`;
    const params = [];
    if (student_id) { query += ` AND student_id = ?`;                            params.push(student_id); }
    if (month)      { query += ` AND DATE_FORMAT(attendance_date, '%Y-%m') = ?`; params.push(month); }
    query += ` ORDER BY attendance_date DESC`;
    const [records] = await db.query(query, params);
    res.json({ success: true, records });
  } catch (err) {
    console.error('Summary fetch error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

// -------------------------------------------------------
// GET /api/attendance/total-hours/:student_id  (Admin only)
// -------------------------------------------------------
router.get('/total-hours/:student_id', verifyToken, async (req, res) => {
  try {
    const [rows] = await db.query(
      `SELECT * FROM v_student_total_hours WHERE student_id = ?`,
      [req.params.student_id]
    );
    res.json({ success: true, data: rows[0] || { total_hours: 0, total_days: 0 } });
  } catch (err) {
    console.error('Total hours error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

// -------------------------------------------------------
// GET /api/attendance/history/:student_id
// -------------------------------------------------------
router.get('/history/:student_id', async (req, res) => {
  const { student_id } = req.params;
  try {
    const [logs] = await db.query(
      `SELECT * FROM attendance_logs WHERE student_id = ? ORDER BY timestamp ASC`,
      [student_id]
    );

    const groups = {};
    logs.forEach(r => {
      // timestamp is already PH time (db timezone: +08:00), so toLocaleDateString
      // with Asia/Manila is consistent
      const dateKey = new Date(r.timestamp).toLocaleDateString('en-CA', { timeZone: 'Asia/Manila' });
      if (!groups[dateKey]) {
        groups[dateKey] = {
          date: dateKey, timeIn: null, timeOut: null,
          timeInRaw: null, timeOutRaw: null,
          task_accomplishment: '', is_overtime: false, totalHours: 0,
        };
      }

      const ts = new Date(r.timestamp);
      if (r.status === 'Time In') {
        groups[dateKey].timeIn    = ts.toLocaleTimeString('en-PH', { hour: '2-digit', minute: '2-digit' });
        groups[dateKey].timeInRaw = ts;
        if (r.is_overtime) groups[dateKey].is_overtime = true;
        if (r.task_accomplishment && r.task_accomplishment !== 'Ongoing...')
          groups[dateKey].task_accomplishment = r.task_accomplishment;
      }
      if (r.status === 'Time Out') {
        groups[dateKey].timeOut    = ts.toLocaleTimeString('en-PH', { hour: '2-digit', minute: '2-digit' });
        groups[dateKey].timeOutRaw = ts;
        if (r.task_accomplishment && r.task_accomplishment !== 'Ongoing...')
          groups[dateKey].task_accomplishment = r.task_accomplishment;
      }

      const g = groups[dateKey];
      if (g.timeInRaw && g.timeOutRaw) {
        const shiftStart  = new Date(g.timeInRaw); shiftStart.setHours(8, 0, 0, 0);
        const effectiveIn = g.timeInRaw < shiftStart ? shiftStart : g.timeInRaw;
        let   effectiveOut = g.timeOutRaw;
        if (!g.is_overtime) {
          const shiftEnd = new Date(g.timeInRaw); shiftEnd.setHours(17, 0, 0, 0);
          if (g.timeOutRaw > shiftEnd) effectiveOut = shiftEnd;
        }
        let hrs = (effectiveOut - effectiveIn) / (1000 * 60 * 60);
        if (hrs > 5) hrs -= 1;
        g.totalHours = Math.max(0, parseFloat(hrs.toFixed(2)));
      }
    });

    const records      = Object.values(groups).sort((a, b) => new Date(b.date) - new Date(a.date));
    const totalHours   = records.reduce((s, r) => s + r.totalHours, 0);
    const daysRendered = records.filter(r => r.timeIn && r.timeOut).length;

    res.json({ success: true, records, totalHours: totalHours.toFixed(2), daysRendered });
  } catch (err) {
    console.error('History fetch error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

// -------------------------------------------------------
// PUT /api/attendance/:date/student/:student_id  (Admin)
// -------------------------------------------------------
router.put('/:date/student/:student_id', verifyToken, async (req, res) => {
  const { date, student_id } = req.params;
  const { time_in, time_out, task_accomplishment, is_overtime } = req.body;

  try {
    if (time_in !== undefined) {
      const newTimestamp = new Date(`${date}T${time_in}:00`);
      await db.query(
        `UPDATE attendance_logs SET timestamp = ?, is_overtime = ?
         WHERE student_id = ? AND status = 'Time In' AND DATE(timestamp) = ?`,
        [newTimestamp, is_overtime ? 1 : 0, student_id, date]
      );
    }

    if (time_out !== undefined) {
      const newTimestamp = new Date(`${date}T${time_out}:00`);

      // Check if a Time Out row already exists for this student on this date
      const [existingOut] = await db.query(
        `SELECT id FROM attendance_logs
         WHERE student_id = ? AND status = 'Time Out' AND DATE(timestamp) = ? LIMIT 1`,
        [student_id, date]
      );

      if (existingOut.length > 0) {
        // Row exists — just update the timestamp
        await db.query(
          `UPDATE attendance_logs SET timestamp = ?
           WHERE student_id = ? AND status = 'Time Out' AND DATE(timestamp) = ?`,
          [newTimestamp, student_id, date]
        );
      } else {
        // ✅ No Time Out row — student forgot to time out.
        // Admin forced it: INSERT a new Time Out row.
        // Grab student_name and is_overtime from the Time In row.
        const [timeInRow] = await db.query(
          `SELECT student_name, is_overtime FROM attendance_logs
           WHERE student_id = ? AND status = 'Time In' AND DATE(timestamp) = ? LIMIT 1`,
          [student_id, date]
        );
        if (timeInRow.length === 0) {
          return res.status(400).json({
            success: false,
            message: 'Cannot force Time Out: no Time In record found for this date.'
          });
        }
        const { student_name, is_overtime } = timeInRow[0];
        await db.query(
          `INSERT INTO attendance_logs (student_id, student_name, status, task_accomplishment, is_overtime, timestamp)
           VALUES (?, ?, 'Time Out', ?, ?, ?)`,
          [student_id, student_name, task_accomplishment || 'Forced time out by admin', is_overtime, newTimestamp]
        );
      }
    }

    if (task_accomplishment !== undefined) {
      const [timeOutRows] = await db.query(
        `SELECT id FROM attendance_logs
         WHERE student_id = ? AND status = 'Time Out'
         AND DATE(timestamp) = ? LIMIT 1`,
        [student_id, date]
      );
      if (timeOutRows.length > 0) {
        await db.query(
          `UPDATE attendance_logs SET task_accomplishment = ?
           WHERE student_id = ? AND status = 'Time Out' AND DATE(timestamp) = ?`,
          [task_accomplishment, student_id, date]
        );
      } else {
        await db.query(
          `UPDATE attendance_logs SET task_accomplishment = ?
           WHERE student_id = ? AND status = 'Time In' AND DATE(timestamp) = ?`,
          [task_accomplishment, student_id, date]
        );
      }
    }

    res.json({ success: true, message: 'Record updated successfully.' });
  } catch (err) {
    console.error('Edit record error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

// -------------------------------------------------------
// POST /api/attendance/manual  (Admin)
// -------------------------------------------------------
router.post('/manual', verifyToken, async (req, res) => {
  const { student_id, date, time_in, time_out, task_accomplishment, is_overtime } = req.body;

  if (!student_id || !date || !time_in) {
    return res.status(400).json({ success: false, message: 'student_id, date, and time_in are required.' });
  }

  try {
    const [rows] = await db.query('SELECT full_name FROM students WHERE id = ? LIMIT 1', [student_id]);
    if (rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Student not found.' });
    }
    const student_name = rows[0].full_name;

    const [existing] = await db.query(
      `SELECT id FROM attendance_logs WHERE student_id = ? AND DATE(timestamp) = ? LIMIT 1`,
      [student_id, date]
    );
    if (existing.length > 0) {
      return res.status(409).json({ success: false, message: 'A record already exists for this student on that date. Use edit instead.' });
    }

    const timeInTs    = new Date(`${date}T${time_in}:00`);
    const overtimeVal = is_overtime ? 1 : 0;

    await db.query(
      `INSERT INTO attendance_logs (student_id, student_name, status, task_accomplishment, is_overtime, timestamp)
       VALUES (?, ?, 'Time In', 'Ongoing...', ?, ?)`,
      [student_id, student_name, overtimeVal, timeInTs]
    );

    if (time_out) {
      const timeOutTs = new Date(`${date}T${time_out}:00`);
      await db.query(
        `INSERT INTO attendance_logs (student_id, student_name, status, task_accomplishment, is_overtime, timestamp)
         VALUES (?, ?, 'Time Out', ?, ?, ?)`,
        [student_id, student_name, task_accomplishment?.trim() || 'No task reported', overtimeVal, timeOutTs]
      );
    }

    res.status(201).json({ success: true, message: 'Record added successfully.' });
  } catch (err) {
    console.error('Manual record error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

module.exports = router;