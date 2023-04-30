import 'package:companion_app_nihar/controllers/auth_controller.dart';
import 'package:companion_app_nihar/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<AuthController>(AuthController());
  }
}
