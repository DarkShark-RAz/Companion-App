import 'package:companion_app/controllers/survey_controller.dart';
import 'package:get/get.dart';

class SurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SurveyController>(SurveyController());
  }
}
