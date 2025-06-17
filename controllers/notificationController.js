const { createNotification, getAllNotifications } = require('../models/notificationModel');

// POST /send-notification
app.post('/send-notification', async (req, res) => {
  const { message } = req.body;

  try {
    // 1. Save to PostgreSQL
    const newNotification = await createNotification(message);

    // 2. Emit to all connected clients
    io.emit('notification', newNotification.message);

    res.status(200).json({
      status: 'Notification sent',
      notification: newNotification
    });
  } catch (error) {
    console.error('Error sending notification:', error);
    res.status(500).json({ error: 'Failed to send notification' });
  }
});


