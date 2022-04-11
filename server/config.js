const mysql = require('mysql2/promise');

const pool = mysql.createPool({
  host: 'localhost',
  user: 'mysql',
  password: '',
  database: 'sneakershop',
  password: 'Chobheemakmak',
  database: 'sneakershopdb',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

module.exports = pool;