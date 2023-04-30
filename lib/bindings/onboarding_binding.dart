import 'package:companion_app_nihar/controllers/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OnboardingController>(OnboardingController());
  }
}
