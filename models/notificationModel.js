const pool = require('./db');

  exports.createNotification = async (message) => {
    const result = await pool.query(
      'INSERT INTO notifications (message) VALUES ($1) RETURNING *',
      [message]
    );
    return result.rows[0];
  };

exports.getAllNotifications = async () => {
  const result = await pool.query(
    'SELECT * FROM notifications ORDER BY created_at DESC'
  );
  return result.rows;
};