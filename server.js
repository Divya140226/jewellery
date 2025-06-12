const express = require('express');
const dotenv = require('dotenv');
const authRoutes = require('./routes/authRoutes');
const brandsRoutes = require('./routes/brandsRoutes');
const productRoutes = require('./routes/productRoutes');
const categoriesRoutes = require('./routes/categoriesRoutes');
const cartItemRoutes = require('./routes/cartItemRoutes');
const wishlistItemsRoutes = require('./routes/wishlistItemsRoutes');
const orderRoutes = require('./routes/orderRoutes');
const reviewsRoutes = require('./routes/reviewRoutes');
const uploader = require('./routes/uploaderRoutes');

const cookieParser = require('cookie-parser');
dotenv.config();

const app = express();
app.use(express.json());
app.use(cookieParser());
app.use('/api/auth', authRoutes);
app.use('/api/product', productRoutes);
app.use('/api/brands', brandsRoutes);
app.use('/api/categories', categoriesRoutes);
app.use('/api/cartItem', cartItemRoutes);
app.use('/api/wishlistItems', wishlistItemsRoutes);
app.use('/api/order', orderRoutes);
app.use('/api/review', reviewsRoutes);
app.use('/api/upload', uploader);
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
