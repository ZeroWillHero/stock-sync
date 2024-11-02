import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_sync/components/errorSnackBar.dart';
import 'package:stock_sync/repository/exceptions/signupFail.dart';
import 'package:stock_sync/screens/Home.dart';
import 'package:stock_sync/screens/Login.dart';
import 'package:stock_sync/screens/Register.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> fireBaseUser;
  ErrSnackBar errSnackBar = ErrSnackBar();

  @override
  void onReady() {
    fireBaseUser = Rx<User?>(_auth.currentUser);
    fireBaseUser.bindStream(_auth.userChanges());
    ever(fireBaseUser, _setInitialScreen);
  }

  void showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: Icon(Icons.error, color: Colors.white),
      duration: Duration(seconds: 3),
      borderRadius: 10.0,
      margin: EdgeInsets.all(10.0),
    );
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LogIn())
        : Get.offAll(() => const Home());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print("User created successfully");
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailAndPasswordFail.code(e.code);
      print(ex.message);
      showErrorSnackbar(ex.message);
    } catch (_) {
      final ex = SignUpEmailAndPasswordFail();
      print(ex.message);
      showErrorSnackbar(ex.message);
    }
  }

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailAndPasswordFail.code(e.code);
      print(ex.message);
      showErrorSnackbar(ex.message);
    } catch (_) {
      final ex = SignUpEmailAndPasswordFail();
      showErrorSnackbar(ex.message);
      print(ex.message);
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}