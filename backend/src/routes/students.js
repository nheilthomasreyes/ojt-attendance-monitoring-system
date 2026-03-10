// src/routes/students.js
// GET  /api/students              — list all students (admin only)
// PUT  /api/students/:id/hours    — update required hours (admin only)
// PUT  /api/students/:id/password — change own password (student)
// GET  /api/students/:id/profile  — get student profile including required_hours (student)

const express         = require('express');
const bcrypt          = require('bcrypt');
const db              = require('../config/db');
const { verifyToken } = require('../middleware/auth');

const router = express.Router();

// ── GET /api/students — admin only ───────────────────────
router.get('/', verifyToken, async (req, res) => {
  try {
    const [students] = await db.query(
      `SELECT id, full_name, email, student_code, is_active, required_hours, registered_at
       FROM students ORDER BY full_name ASC`
    );
    res.json({ success: true, students });
  } catch (err) {
    console.error('Fetch students error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

// ── PUT /api/students/:id/hours — admin sets required hours ──
router.put('/:id/hours', verifyToken, async (req, res) => {
  const { id }             = req.params;
  const { required_hours } = req.body;

  if (required_hours === undefined || required_hours === null) {
    return res.status(400).json({ success: false, message: 'required_hours is required.' });
  }

  const hours = parseFloat(required_hours);
  if (isNaN(hours) || hours < 0) {
    return res.status(400).json({ success: false, message: 'required_hours must be a positive number.' });
  }

  try {
    await db.query(
      `UPDATE students SET required_hours = ? WHERE id = ?`,
      [hours, id]
    );
    res.json({ success: true, message: 'Required hours updated.', required_hours: hours });
  } catch (err) {
    console.error('Update required hours error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

// ── PUT /api/students/:id/password — student changes own password ──
router.put('/:id/password', async (req, res) => {
  const { id } = req.params;
  const { current_password, new_password } = req.body;

  // Validation
  if (!current_password || !new_password) {
    return res.status(400).json({ success: false, message: 'Both current and new password are required.' });
  }
  if (new_password.length < 6) {
    return res.status(400).json({ success: false, message: 'New password must be at least 6 characters.' });
  }

  try {
    // Fetch the student row (password hash is stored here from registration)
    const [rows] = await db.query(
      `SELECT id, password FROM students WHERE id = ? AND is_active = 1 LIMIT 1`,
      [id]
    );

    if (rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Student not found.' });
    }

    // Verify current password against stored bcrypt hash
    // Same pattern as studentAuth.js login: bcrypt.compare(plain, hash)
    const isMatch = await bcrypt.compare(current_password, rows[0].password);
    if (!isMatch) {
      return res.status(401).json({ success: false, message: 'Current password is incorrect.' });
    }

    // Hash the new password with same cost factor (10) used in registration
    const hashedNewPassword = await bcrypt.hash(new_password, 10);

    // Update in DB
    await db.query(
      `UPDATE students SET password = ? WHERE id = ?`,
      [hashedNewPassword, id]
    );

    res.json({ success: true, message: 'Password updated successfully.' });

  } catch (err) {
    console.error('Change password error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

// ── GET /api/students/:id/profile — student reads own profile ──
router.get('/:id/profile', async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await db.query(
      `SELECT id, full_name, email, student_code, required_hours, registered_at
       FROM students WHERE id = ? AND is_active = 1 LIMIT 1`,
      [id]
    );
    if (rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Student not found.' });
    }
    res.json({ success: true, student: rows[0] });
  } catch (err) {
    console.error('Fetch profile error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

module.exports = router;