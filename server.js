const express = require('express');
const dotenv = require('dotenv');
const http = require('http');
const socketIo = require('socket.io');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const path = require('path');
dotenv.config();

// First initialize `app`
const app = express();

// Then use it to create the server
const server = http.createServer(app);

// Now set up Socket.IO
const io = socketIo(server, {
  cors: {
    origin: '*',  // set your frontend origin
    methods: ['GET', 'POST']
  }
});
require('./socket')(io);
// Middleware
app.use(cors({
  origin: 'http://localhost:5173',
  credentials: true
}));
app.use(express.json());
app.use(cookieParser());


// Routes
const authRoutes = require('./routes/authRoutes');
const brandsRoutes = require('./routes/brandsRoutes');
const enquiriesRoutes = require('./routes/enquiriesRoutes');
const productRoutes = require('./routes/productRoutes');
const categoriesRoutes = require('./routes/categoriesRoutes');
const cartItemRoutes = require('./routes/cartItemRoutes');
const wishlistItemsRoutes = require('./routes/wishlistItemsRoutes');
const orderRoutes = require('./routes/orderRoutes');
const reviewsRoutes = require('./routes/reviewRoutes');
const uploader = require('./routes/uploaderRoutes');
const notificationRoutes = require('./routes/notificationRoutes');
const chatRoutes = require('./routes/chatRoutes');
const paymentRoutes = require('./routes/paymentRoutes');
const authenticate = require('./middleware/authMiddleware.js');

app.use('/api/auth', authRoutes);
// app.use('/api/product', authenticate, productRoutes);
// app.use('/api/brands', authenticate, brandsRoutes);
// app.use('/api/enquiries', authenticate, enquiriesRoutes);
// app.use('/api/chat', authenticate, chatRoutes);
// app.use('/api/notification', authenticate, notificationRoutes);
// app.use('/api/categories', authenticate, categoriesRoutes);
// app.use('/api/cartItem', authenticate, cartItemRoutes);
// app.use('/api/wishlistItems', authenticate, wishlistItemsRoutes);
// app.use('/api/order', authenticate, orderRoutes);
// app.use('/api/review', authenticate, reviewsRoutes);
// app.use('/api/upload', authenticate, uploader);
// app.use('/api/payment',authenticate, paymentRoutes);
app.use('/api/brands',  brandsRoutes);
app.use('/api/enquiries', enquiriesRoutes);
app.use('/api/chat', chatRoutes);
app.use('/api/notification', notificationRoutes);
app.use('/api/categories',  categoriesRoutes);
app.use('/api/product',  productRoutes);
app.use('/api/cartItem',  cartItemRoutes);
app.use('/api/wishlistItems',  wishlistItemsRoutes);
app.use('/api/order', orderRoutes);
app.use('/api/review', reviewsRoutes);
app.use('/api/upload',  uploader);
app.use('/api/payment', paymentRoutes);
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
// Default route
app.get('/', (req, res) => {
  res.send('Socket server running');
});
// Start server
const PORT = process.env.PORT || 3000;
server.listen(PORT, () => console.log(`Server running on port ${PORT}`));
