// server.js — Main entry point
require('dotenv').config();

process.on('uncaughtException', (err) => {
  console.error('UNCAUGHT EXCEPTION:', err.stack);
});

const express = require('express');
const cors    = require('cors');

// Routes
const adminAuthRoutes   = require('./src/routes/adminAuth');
const studentAuthRoutes = require('./src/routes/studentAuth');
const attendanceRoutes  = require('./src/routes/attendance');
const settingsRoutes    = require('./src/routes/settings');
const studentsRoutes    = require('./src/routes/students');
const networkRoutes     = require('./src/routes/network');

const app  = express();
const PORT = process.env.PORT || 5000;

// ── Trust proxy ─────────────────────────────────────────
app.set('trust proxy', true);

// ── CORS — allow both localhost and network IP ──────────
// This fixes "Failed to fetch" on phones accessing via 192.168.0.x
const allowedOrigins = [
  'https://localhost:3000',
  'https://127.0.0.1:3000',
  `https://${process.env.HOST_IP || '192.168.0.126'}:3000`, 
];

app.use(cors({
  origin: (origin, callback) => {
    // Allow requests with no origin (mobile apps, Postman, curl)
    if (!origin) return callback(null, true);

    // Allow localhost on any port (http or https)
    if (/^https?:\/\/(localhost|127\.0\.0\.1)(:\d+)?$/.test(origin)) {
      return callback(null, true);
    }

    // Allow any 192.168.0.x origin on any port (http or https)
    if (/^https?:\/\/192\.168\.0\.\d+(:\d+)?$/.test(origin)) {
      return callback(null, true);
    }

    callback(new Error(`CORS blocked: ${origin}`));
  },
  credentials: true,
}));

app.use(express.json());

// ── Routes ──────────────────────────────────────────────
app.use('/api/admin',      adminAuthRoutes);
app.use('/api/student',    studentAuthRoutes);
app.use('/api/attendance', attendanceRoutes);
app.use('/api/settings',   settingsRoutes);
app.use('/api/students',   studentsRoutes);
app.use('/api/network',    networkRoutes);

// ── Health Check ────────────────────────────────────────
app.get('/api/health', (req, res) => {
  res.json({ success: true, message: 'OJT Backend is running ✅' });
});

// ── 404 Handler ─────────────────────────────────────────
app.use((req, res) => {
  res.status(404).json({ success: false, message: `Route ${req.path} not found.` });
});

// ── Start Server — listen on all interfaces ─────────────
// '0.0.0.0' allows phones on the same WiFi to reach the backend
const https = require('https');
const fs    = require('fs');
const path  = require('path');

const sslOptions = {
  key:  fs.readFileSync(path.join(__dirname, 'key.pem')),
  cert: fs.readFileSync(path.join(__dirname, 'cert.pem')),
};

https.createServer(sslOptions, app).listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 OJT Backend running on https://192.168.0.126:${PORT}`);
});