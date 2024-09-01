import 'dart:convert';
import 'package:http/http.dart' as http;

class DataSource {
  final String baseUrl;

  DataSource({required this.baseUrl});

  Future<void> sendData(Map<String, String> productData) async {
    try {
      var url = Uri.parse('$baseUrl/api/add_product');
      var response = await http.post(
        url,
        body: jsonEncode(productData),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        print("Product added successfully");
      } else {
        print("Failed to add product");
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<List<Product>> getData() async {
    try {
      var url = Uri.parse('$baseUrl/api/products');
      var response =
          await http.get(url, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        // Parse the response body as JSON and return the list of products
        var data = jsonDecode(response.body);
        print('This is the data from products get request: $data');

        List<dynamic> productsJson = data['products'];
        List<Product> products = productsJson
            .map((productsInJsonForm) => Product.fromJson(productsInJsonForm))
            .toList();
        return products; // Correctly returning the list of products
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<void> updateData(int id, Map<String, String> productData) async {
    try {
      var url = Uri.parse('$baseUrl/api/update_product/$id');
      var response = await http.put(
        url,
        body: jsonEncode(productData),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        print("Product updated successfully");
      } else {
        print("Failed to update product");
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deleteData(int id) async {
    try {
      var url = Uri.parse('$baseUrl/api/delete_product/$id');
      var response =
          await http.delete(url, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        print("Product deleted successfully");
      } else {
        print("Failed to delete product");
      }
    } catch (e) {
      throw (e);
    }
  }
}

class Product {
  final int id;
  final String name;
  final String price;
  final String desc;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.desc,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      desc: json['desc'],
    );
  }
}
