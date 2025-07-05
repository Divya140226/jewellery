const express = require('express');
const router = express.Router();
const enquiriesController = require('../controllers/enquiriesController');

router.get('/', enquiriesController.getAllEnquiries);
router.post('/add', enquiriesController.addEnquiries);
router.get('/:id', enquiriesController.getEnquiriesById);
router.put('/update/:id', enquiriesController.updateEnquiries);
router.delete('/delete/:id', enquiriesController.deleteEnquiries);

module.exports = router;