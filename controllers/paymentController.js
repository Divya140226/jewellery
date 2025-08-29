const razorpay = require('../commonFunction/razorpay');
const paymentModel = require('../models/paymentModel');
const orderModel = require('../models/orderModel');

exports.createOrder = async (req, res) => {
  try {
    const { amount, currency = 'INR', userId } = req.body;

    // 1. Create Razorpay Order
    const options = {
      amount: amount * 100, // in paise
      currency,
      receipt: `rcpt_${Date.now()}`,
    };
    const order = await razorpay.orders.create(options);

    // 2. Insert into orders table
    const orderData = {
      userId,
      razorpayOrderId: order.id,
      amount,
      currency,
      status: order.status || 'created', // usually 'created'
    };
    const savedOrder = await orderModel.insertOrder(orderData);

    // 3. Insert into payments table
    const paymentData = {
      userId,
      orderId: order.id,
      amount,
      currency,
      status: 'created',
    };
    const savedPayment = await paymentModel.insertPayment(paymentData);

    // 4. Respond
    res.status(201).json({
      success: true,
      razorpayOrder: order,
      orderRecord: savedOrder,
      paymentRecord: savedPayment,
    });

  } catch (err) {
    console.error('Error creating payment order:', err);
    res.status(500).json({ success: false, message: 'Internal server error' });
  }
};
exports.verifyPayment = async (req, res) => {
  try {
    const { paymentId, orderId, signature } = req.body;

    const body = orderId + '|' + paymentId;
    const expectedSignature = crypto
      .createHmac('sha256', process.env.RAZORPAY_KEY_SECRET)
      .update(body.toString())
      .digest('hex');

    if (expectedSignature !== signature) {
      return res.status(400).json({ status: 'failed', message: 'Invalid signature' });
    }

    // TODO: update DB payment & order status to "paid"
    // await paymentModel.markPaid({ orderId, paymentId });
    // await orderModel.markPaid({ razorpayOrderId: orderId });

    return res.json({ status: 'success' });
  } catch (err) {
    console.error('Verify payment error:', err);
    return res.status(500).json({ status: 'failed', message: 'Server error' });
  }
};
