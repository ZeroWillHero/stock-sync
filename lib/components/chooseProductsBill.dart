import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_sync/constants/Constants.dart';
import 'package:stock_sync/controllers/productController/ProductController.dart';
import '../models/productModel.dart';

class Chooseproductsbill extends StatefulWidget {
  const Chooseproductsbill({super.key});

  @override
  State<Chooseproductsbill> createState() => ChooseproductsbillState();
}

class ChooseproductsbillState extends State<Chooseproductsbill> {
  final ProductController _productController = Get.put(ProductController());
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();
  Product? selectedProduct;
  int? selectedAmount;
  List<Map<String, dynamic>> selectedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_productController.isLoading.value) {
        return CircularProgressIndicator();
      } else {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Shop Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            TextFormField(
              controller: shopNameController,
              decoration: InputDecoration(
                labelText: "shop name",
                hintText: "Enter Shop Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Add Product",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<Product>(
              hint: Text("Select Product"),
              value: selectedProduct,
              onChanged: (Product? newValue) {
                setState(() {
                  selectedProduct = newValue;
                });
              },
              items: _productController.products.map((Product product) {
                return DropdownMenuItem<Product>(
                  value: product,
                  child: Text(product.name),
                );
              }).toList(),
            ),
            DropdownButtonFormField<int>(
              hint: Text("Select Amount"),
              value: selectedAmount,
              onChanged: (int? newValue) {
                setState(() {
                  selectedAmount = newValue;
                });
              },
              items: List.generate(100, (index) => index + 1).map((int amount) {
                return DropdownMenuItem<int>(
                  value: amount,
                  child: Text(amount.toString()),
                );
              }).toList(),
            ),

            SizedBox(height: 20),
            TextFormField(
              controller: unitPriceController,
              decoration: InputDecoration(
                labelText: "Unit Price",
                hintText: "Enter Unit Price",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedProduct != null && selectedAmount != null && unitPriceController.text.isNotEmpty) {
                  setState(() {
                    selectedProducts.add({
                      'product': selectedProduct,
                      'amount': selectedAmount,
                      'unitPrice': double.tryParse(unitPriceController.text) ?? 0.0,
                    });
                    selectedProduct = null;
                    selectedAmount = null;
                    unitPriceController.clear();
                  });
                }
              },
              child: Text("Add Product"),
              style: ElevatedButton.styleFrom(
                backgroundColor: tertiaryColor,
                foregroundColor: secondaryColor,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: selectedProducts.length,
              itemBuilder: (context, index) {
                final product = selectedProducts[index]['product'] as Product;
                final amount = selectedProducts[index]['amount'] as int;
                final unitPrice = selectedProducts[index]['unitPrice'] as double;
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text("Amount: $amount, Unit Price: $unitPrice"),
                );
              },
            ),
          ],
        );
      }
    });
  }
}