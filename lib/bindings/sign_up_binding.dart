import 'package:companion_app_nihar/controllers/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
  }
}
