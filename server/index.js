const express = require('express');
const app = express();
const port = 2000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const productData = [];

app.listen(port, () => { 
    const os = require('os');
    const networkInterfaces = os.networkInterfaces();
    let serverIP = 'localhost';

    for (let interface in networkInterfaces) {
        networkInterfaces[interface].forEach(address => {
            if (address.family === 'IPv4' && !address.internal) {
                serverIP = address.address;
            }
        });
    }

    console.log(`Server is running at:`);
    console.log(`http://${serverIP}:${port}/api/add_product`);
    console.log(`Or access it via localhost:`);
    console.log(`http://localhost:${port}/api/add_product`);
});

// Add a product
app.post('/api/add_product', (req, res) => {
    console.log("Received Data:", req.body);

    if (!req.body.name || !req.body.price || !req.body.desc) {
        return res.status(400).send({
            "status-code": 400,
            "message": "Product data is incomplete",
        });
    }

    const newProduct = {
        id: productData.length + 1,
        name: req.body.name,
        price: req.body.price,
        desc: req.body.desc
    };

    productData.push(newProduct);
    console.log("Updated Product List:", productData);

    res.status(200).send({
        "status-code": 200,
        "message": "Product added successfully",
        "Product": newProduct
    });
});

// Get all products
app.get('/api/products', (req, res) => {
    console.log('Fetching all products...'); 
    res.status(200).send({ 
        'status-code': 200, 
        'message': 'Products retrieved successfully', 
        'products': productData
    });
});

// Update a product
app.put('/api/update_product/:id', (req, res) => {
    const productId = parseInt(req.params.id);
    const product = productData.find(p => p.id === productId);

    if (!product) {
        return res.status(404).send({
            "status-code": 404,
            "message": "Product not found",
        });
    }

    if (!req.body.name || !req.body.price || !req.body.desc) {
        return res.status(400).send({
            "status-code": 400,
            "message": "Product data is incomplete",
        });
    }

    product.name = req.body.name;
    product.price = req.body.price;
    product.desc = req.body.desc;

    console.log(`Product with ID ${productId} updated:`, product);

    res.status(200).send({
        "status-code": 200,
        "message": "Product updated successfully",
        "Product": product
    });
});

// Delete a product
app.delete('/api/delete_product/:id', (req, res) => {
    const productId = parseInt(req.params.id);
    const productIndex = productData.findIndex(p => p.id === productId);

    if (productIndex === -1) {
        return res.status(404).send({
            "status-code": 404,
            "message": "Product not found",
        });
    }

    const deletedProduct = productData.splice(productIndex, 1)[0];
    console.log(`Product with ID ${productId} deleted:`, deletedProduct);

    res.status(200).send({
        "status-code": 200,
        "message": "Product deleted successfully",
        "Product": deletedProduct
    });
});
