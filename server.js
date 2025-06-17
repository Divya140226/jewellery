// const express = require('express');
// const dotenv = require('dotenv');
// const authRoutes = require('./routes/authRoutes');
// const brandsRoutes = require('./routes/brandsRoutes');
// const productRoutes = require('./routes/productRoutes');
// const categoriesRoutes = require('./routes/categoriesRoutes');
// const cartItemRoutes = require('./routes/cartItemRoutes');
// const wishlistItemsRoutes = require('./routes/wishlistItemsRoutes');
// const orderRoutes = require('./routes/orderRoutes');
// const reviewsRoutes = require('./routes/reviewRoutes');
// const uploader = require('./routes/uploaderRoutes');

// const authenticate = require('./middleware/authMiddleware.js');
// const cookieParser = require('cookie-parser');
// dotenv.config();

// const app = express();
// app.use(express.json());
// app.use(cookieParser());
// app.use('/api/auth', authRoutes);

// app.use('/api/product',authenticate, productRoutes);
// app.use('/api/brands',authenticate, brandsRoutes);
// app.use('/api/categories', authenticate,categoriesRoutes);
// app.use('/api/cartItem', authenticate,cartItemRoutes);
// app.use('/api/wishlistItems', authenticate, wishlistItemsRoutes);
// app.use('/api/order',authenticate, orderRoutes);
// app.use('/api/review', authenticate,reviewsRoutes);
// app.use('/api/upload', authenticate, uploader);

// const PORT = process.env.PORT || 5000;
// app.listen(PORT, () => console.log(`Server running on port ${PORT}`));


const express = require('express');
const dotenv = require('dotenv');
const http = require('http');
const socketIo = require('socket.io');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const { createNotification, getAllNotifications } = require('./models/notificationModel');
dotenv.config();

// First initialize `app`
const app = express();

// Then use it to create the server
const server = http.createServer(app);

// Now set up Socket.IO
const io = socketIo(server, {
  cors: {
    origin: "*",
  }
});

// Middleware
app.use(cors());
app.use(express.json());
app.use(cookieParser());

// Routes
const authRoutes = require('./routes/authRoutes');
const brandsRoutes = require('./routes/brandsRoutes');
const productRoutes = require('./routes/productRoutes');
const categoriesRoutes = require('./routes/categoriesRoutes');
const cartItemRoutes = require('./routes/cartItemRoutes');
const wishlistItemsRoutes = require('./routes/wishlistItemsRoutes');
const orderRoutes = require('./routes/orderRoutes');
const reviewsRoutes = require('./routes/reviewRoutes');
const uploader = require('./routes/uploaderRoutes');
const authenticate = require('./middleware/authMiddleware.js');

app.use('/api/auth', authRoutes);
app.use('/api/product', authenticate, productRoutes);
app.use('/api/brands', authenticate, brandsRoutes);
app.use('/api/categories', authenticate, categoriesRoutes);
app.use('/api/cartItem', authenticate, cartItemRoutes);
app.use('/api/wishlistItems', authenticate, wishlistItemsRoutes);
app.use('/api/order', authenticate, orderRoutes);
app.use('/api/review', authenticate, reviewsRoutes);
app.use('/api/upload', authenticate, uploader);

// Default route
app.get('/', (req, res) => {
  res.send('Socket server running');
});
app.post('/send-notification', async (req, res) => {
  const { message } = req.body;

  try {
    // Save to PostgreSQL
    const newNotification = await createNotification(message);

    // Emit to all connected clients
    io.emit('notification', newNotification.message);

    res.status(200).json({
      status: 'Notification sent',
      notification: newNotification,
    });
  } catch (error) {
    console.error('Error sending notification:', error);
    res.status(500).json({ error: 'Failed to send notification' });
  }
});

// GET: Fetch All Notifications
app.get('/notifications', async (req, res) => {
  try {
    const notifications = await getAllNotifications();
    res.json(notifications);
  } catch (error) {
    console.error('Error fetching notifications:', error);
    res.status(500).json({ error: 'Failed to fetch notifications' });
  }
});


// Socket.IO: Handle connection
io.on('connection', (socket) => {
  console.log('Client connected:', socket.id);

  socket.on('disconnect', () => {
    console.log('Client disconnected:', socket.id);
  });
});


// Start server
const PORT = process.env.PORT || 5000;
server.listen(PORT, () => console.log(`Server running on port ${PORT}`));
