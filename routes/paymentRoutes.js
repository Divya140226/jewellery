const express = require('express');
const router = express.Router();
const paymentController = require('../controllers/paymentController');

router.post('/create-order', paymentController.createOrder);
// routes/paymentRoutes.js
router.post('/verify-payment', paymentController.verifyPayment);

module.exports = router;
