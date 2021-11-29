import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser;
  var userAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();

    _firebaseUser.bindStream(_auth?.authStateChanges());
    ever(_firebaseUser, (User user) {
      if (user != null) {
        userAuthenticated.value = true;
      }else{
        userAuthenticated.value = false;
      }
    });
  }

  User get user => _firebaseUser.value;
  static AuthService get to => Get.find<AuthService>();

  showSnack(String title, String error) {
    Get.snackbar(
      title,
      error,
      backgroundColor: Colors.grey.shade300,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      );
  }

  createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      showSnack('register error', e.message);
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      showSnack('login error', e.message);
    }
  }

  logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      showSnack('logout error', e.message);
    }
  }
}