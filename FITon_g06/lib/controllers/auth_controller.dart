import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postos_locais/services/auth_service.dart';

class AuthController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  // ignore: non_constant_identifier_names
  final confirm_password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var isLoged = true.obs;
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    ever(isLoged, (visible) {
      formKey.currentState.reset();
    });
  }

  login() async {
    isLoading.value = true;
    await AuthService.to.login(email.text, password.text);
    isLoading.value = false;
  }

  signUp() async {
    isLoading.value = true;
    await AuthService.to.createUser(email.text, password.text);
    isLoading.value = false;
  }

  toogleRegistrar() {
    isLoged.value = !isLoged.value;
  }
}