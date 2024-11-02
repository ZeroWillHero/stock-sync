import "package:stock_sync/models/userModel.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_sync/repository/authentication_repo.dart';
import 'package:stock_sync/repository/userRepo.dart';

class Registercontroller extends GetxController {
  static Registercontroller instance = Get.find();
  var isChecked = false.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepo());

  void toggleCheck() {
    isChecked.value = !isChecked.value;
  }

  void register(String email, String password) {

    AuthenticationRepo.instance.createUserWithEmailAndPassword(email, password);
  }

  void login(String email, String password) {

    AuthenticationRepo.instance.logInWithEmailAndPassword(email, password);
  }

  Future<void> createUser(User user) async {
    try {
      await userRepo.createUser(user);
      register(user.email, user.password);
    } catch (e) {
      // Show error Snackbar
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: Icon(Icons.error, color: Colors.white),
        duration: Duration(seconds: 3),
        borderRadius: 10.0,
        margin: EdgeInsets.all(10.0),
      );
    }
  }
}
