import 'package:postos_locais/core.dart';
import 'package:get/get.dart';

class TrainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TrainController>(TrainController());
  }
}
