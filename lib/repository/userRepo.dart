import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:stock_sync/models/userModel.dart";

class UserRepo extends GetxController{
  static UserRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // user CRUD operations
createUser (User user) async  {
 await _db.collection("Users").add(
    user.toJson()
  );

}

Future<User> getUserDetails (String email)async {
  final snapshot = await _db.collection('Users').where("email",isEqualTo: email).get();
  final data = snapshot.docs.map((e) => User.fromSnapshot(e)).single;
  return data;
}

  Future<List<User>> getAllUsers ()async {
    final snapshot = await _db.collection('Users').get();
    final data = snapshot.docs.map((e) => User.fromSnapshot(e)).toList();
    return data;
  }




}