import 'package:flutter/material.dart';
import 'package:simple_clean_fetching_data/data/data.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _POSTState();
}

class _POSTState extends State<Homepage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  // Create an instance of DataSource with the required baseUrl
  final DataSource dataSource = DataSource(baseUrl: 'http://192.168.0.10:2000');

  // Initialize productsList as an empty list
  List<Product> productsList = [];
  Product? selectedProduct; // Track the selected product for editing

  // Method to handle the submission of data
  void handleSubmit() {
    var data = {
      "name": nameController.text,
      "price": priceController.text,
      "desc": descController.text,
    };

    dataSource.sendData(data);
    handleGet(); // Refresh the list after submission
  }

  // Method to handle the fetching of data
  void handleGet() async {
    List<Product> products = await dataSource.getData();
    setState(() {
      productsList = products;
    });
  }

  // Method to handle the updating of a product
  void handleUpdate() {
    if (selectedProduct != null) {
      var updatedData = {
        "name": nameController.text,
        "price": priceController.text,
        "desc": descController.text,
      };

      dataSource.updateData(selectedProduct!.id, updatedData);
      selectedProduct = null; // Reset the selected product
      handleGet(); // Refresh the list after update
    }
  }

  // Method to handle the deletion of a product
  void handleDelete(Product product) {
    dataSource.deleteData(product.id);
    handleGet(); // Refresh the list after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Product Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: "Product Price"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descController,
              decoration:
                  const InputDecoration(labelText: "Product Description"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedProduct == null ? handleSubmit : handleUpdate,
              child: Text(selectedProduct == null ? "POST" : "UPDATE"),
            ),
            Expanded(
              child: productsList.isEmpty
                  ? const Center(child: Text('No products available'))
                  : ListView.builder(
                      itemCount: productsList.length,
                      itemBuilder: (context, index) {
                        final product = productsList[index];
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: product == selectedProduct
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            leading: Text(product.name),
                            title: Text('£${product.price}'),
                            subtitle: Text(product.desc),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.orange),
                                  onPressed: () {
                                    setState(() {
                                      selectedProduct = product;
                                      nameController.text = product.name;
                                      priceController.text = product.price;
                                      descController.text = product.desc;
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    handleDelete(product);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
