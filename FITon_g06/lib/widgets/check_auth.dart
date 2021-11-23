import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postos_locais/core.dart';
import 'package:postos_locais/services/auth_service.dart';

class CheckAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Obx(() => AuthService.to.userAuthenticated.value
      ? MainView()
      : LoginView()
    );
  }
}