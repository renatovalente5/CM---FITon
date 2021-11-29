import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

class MainController extends GetxController {
  static MainController to = Get.find();

  final pageCotroller = PageController();
  final animationDuration = const Duration(milliseconds: 350);
  List<BottomBarItem> navigationItems;

  @override
  Future<void> onInit() async {
    navigationItems = NavigationService().getNavigationItemList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageCotroller.dispose();
    Get.delete();
    print("[ MainController ] => onClose()");
    super.onClose();
  }
}
