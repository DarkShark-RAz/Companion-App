import 'package:companion_app/controllers/specialist_controller.dart';
import 'package:get/get.dart';

class SpecialistBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SpecialistController>(SpecialistController());
  }
}
