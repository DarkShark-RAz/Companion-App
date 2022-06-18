import 'package:companion_app/controllers/auth_controller.dart';
import 'package:companion_app/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<AuthController>(AuthController());
  }
}
