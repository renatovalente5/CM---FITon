import 'package:postos_locais/core.dart';
import 'package:postos_locais/main.dart';
import 'package:get/get.dart';

class TrainController extends GetxController {
  static TrainController to = Get.find();
  List<Exercise> exercises = [];

  @override
  void onInit() async {
    super.onInit();
    await loadData();
  }

  loadData() {
    exercises = ExerciseService().getExercises();
    Pontos();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
