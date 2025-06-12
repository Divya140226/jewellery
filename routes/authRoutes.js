const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

router.post('/register', authController.register);
router.post('/login', authController.login);
router.post('/forgot-password', authController.forgotPassword);
router.post('/reset-password', authController.resetPassword);
router.post('/logout', authController.logout);

router.post('/request-login-otp', authController.requestLoginOtp);
router.post('/verify-login-otp', authController.verifyLoginOtp);
router.post('/logout-user', authController.logoutUser);

module.exports = router;
