import 'package:companion_app_nihar/controllers/survey_controller.dart';
import 'package:get/get.dart';

class SurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SurveyController>(SurveyController());
  }
}
