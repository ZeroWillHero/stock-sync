import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_sync/components/chooseProductsBill.dart';
import 'package:stock_sync/constants/Constants.dart';
import 'package:stock_sync/models/billModel.dart';
import 'package:stock_sync/models/productModel.dart';
import 'package:stock_sync/repository/billRepo.dart';

class BillFields extends StatefulWidget {
  const BillFields({super.key});

  @override
  State<BillFields> createState() => _BillFieldsState();
}

class _BillFieldsState extends State<BillFields> {
  final GlobalKey<ChooseproductsbillState> _chooseProductsBillKey = GlobalKey<ChooseproductsbillState>();
  final BillRepo _billRepo = BillRepo();
  String _status = 'unpaid'; // Default status

  void _createBill() async {
    final shopName = _chooseProductsBillKey.currentState?.shopNameController.text;
    final selectedProducts = _chooseProductsBillKey.currentState?.selectedProducts;

    if (shopName != null && selectedProducts != null && selectedProducts.isNotEmpty) {
      final products = selectedProducts.map((item) {
        return Product(
          name: item['product'].name,
          id: item['product'].id,
          stock: item['amount'],
          unitPrice: item['unitPrice'],
        );
      }).toList();

      final totalPrice = products.fold(0.0, (sum, item) => sum + (item.unitPrice * item.stock));

      final bill = Bill(
        products: products,
        date: DateTime.now(),
        totalPrice: totalPrice,
        shopName: shopName,
        status: _status, // New field
      );

      await _billRepo.createBill(bill);

      print('Bill created successfully');
      Get.snackbar("Success", "Added Bill Successfully.....!");
    } else {
      print('Please fill in all fields and add at least one product.');
      Get.snackbar("Failed", "Check your fields.....!");


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
                DropdownButtonFormField<String>(
                  value: _status,
                  onChanged: (String? newValue) {
                    setState(() {
                      _status = newValue!;
                    });
                  },
                  items: <String>['paid', 'unpaid'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: "Status",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
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