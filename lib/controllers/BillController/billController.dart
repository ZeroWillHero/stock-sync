import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_sync/components/chooseProductsBill.dart';
import 'package:stock_sync/constants/Constants.dart';
import 'package:stock_sync/controllers/productController/ProductController.dart';
import 'package:stock_sync/models/productModel.dart';

class BillFields extends StatefulWidget {
  const BillFields({super.key});

  @override
  State<BillFields> createState() => _BillFieldsState();
}

class _BillFieldsState extends State<BillFields> {
  final GlobalKey<ChooseproductsbillState> _chooseProductsBillKey = GlobalKey<ChooseproductsbillState>();

  void _createBill() {
    final shopName = _chooseProductsBillKey.currentState?.shopNameController.text;
    final selectedProducts = _chooseProductsBillKey.currentState?.selectedProducts;

    if (shopName != null && selectedProducts != null && selectedProducts.isNotEmpty) {
      // Handle bill creation logic here
      print('Shop Name: $shopName');
      print('Selected Products: $selectedProducts');

    } else {
      // Handle validation error
      print('Please fill in all fields and add at least one product.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Chooseproductsbill(key: _chooseProductsBillKey),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: _createBill,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tertiaryColor,
                      foregroundColor: secondaryColor,
                    ),
                    child: const Text("Create Bill"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}