import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_sync/components/NavBar.dart';
import 'package:stock_sync/constants/Constants.dart';
import 'package:stock_sync/controllers/productController/ProductController.dart';
import 'package:stock_sync/models/productModel.dart';

class Addproducts extends StatefulWidget {
  const Addproducts({super.key});

  @override
  State<Addproducts> createState() => _AddproductsState();
}

class _AddproductsState extends State<Addproducts> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _stockController = TextEditingController();
  final _unitPriceController = TextEditingController();
  final ProductController _productController = Get.put(ProductController());

  @override
  void dispose() {
    _nameController.dispose();
    _stockController.dispose();
    _unitPriceController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _addProduct() {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        name: _nameController.text,
        stock: int.parse(_stockController.text),
        unitPrice: double.parse(_unitPriceController.text),
      );
      _nameController.clear();
      _stockController.clear();
      _unitPriceController.clear();
      _productController.createProduct(product);
      _showSnackBar("Product added successfully");

      // Get.back(); // Navigate back after adding the product
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const NavBar(image: 'admin.png', user: "Add Products"),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
                child: Container(
                  color: primaryColor,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  labelText: "Product name",
                                  hintText: "Product name",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white), // Change this color
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a product name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _stockController,
                                decoration: const InputDecoration(
                                  labelText: "Stock",
                                  hintText: "Stock",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white), // Change this color
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the stock';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _unitPriceController,
                                decoration: const InputDecoration(
                                  labelText: "Unit Price",
                                  hintText: "Unit Price",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white), // Change this color
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the unit price';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _addProduct,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: secondaryColor,
                                foregroundColor: tertiaryColor,
                              ),
                              child: Text("Add Product"),
                            ),
                            const SizedBox(height: 20)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}