const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');
router.get('/new-arrivals', productController.getAllArrivals);
router.get('/filter', productController.filterProduct);

router.get('/', productController.getAllProduct);
router.get('/Categories-Product/:category_id', productController.getCategoriesProduct);
router.get('/search', productController.searchProductByName);
router.post('/add', productController.addProduct);
router.get('/:id', productController.getProductById);
router.put('/update/:id', productController.updateProduct);
router.delete('/delete/:id', productController.deleteProduct);

module.exports = router;