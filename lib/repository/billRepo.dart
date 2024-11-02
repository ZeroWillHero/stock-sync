import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stock_sync/models/billModel.dart';
import 'package:stock_sync/models/productModel.dart';
import 'package:stock_sync/repository/productRepo.dart';

class BillRepo {
  final CollectionReference _billsCollection = FirebaseFirestore.instance.collection('bills');
  final ProductRepo _productRepo = Get.put(ProductRepo());

  Future<void> createBill(Bill bill) async {
    await _billsCollection.add(bill.toJson());

    for (var product in bill.products) {
      final productDetails = await _productRepo.getProductDetails(product.id!);
      final newStock = productDetails.stock - product.stock;
      await _productRepo.updateProductStock(product.id!, newStock);
    }
  }

  Future<List<Bill>> getAllBills() async {
    QuerySnapshot querySnapshot = await _billsCollection.get();
    return querySnapshot.docs.map((doc) {
      return Bill.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<void> updateBill(String id, Bill bill) async {
    await _billsCollection.doc(id).update(bill.toJson());
  }

  Future<void> deleteBill(String id) async {
    await _billsCollection.doc(id).delete();
  }
}