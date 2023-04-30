import 'package:companion_app_nihar/services/firebase/firebase_auth.dart';
import 'package:companion_app_nihar/shared/indicator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  final FirebaseAuthentication _authentication = FirebaseAuthentication();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final TextEditingController mailForResetPass = TextEditingController();

  void onLogin() async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      if (!EmailValidator.validate(email.text)) {
        Get.snackbar("Error", "Enter a valid email");
      } else {
        Indicator.showLoading();
        await _authentication.login(email.text, password.text).then((value) {
          email.clear();
          password.clear();
          FocusManager.instance.primaryFocus?.unfocus();
        });
      }
    } else {
      Get.snackbar("Error", "All fields are required");
    }
  }

  void resetPassword() async {
    if (mailForResetPass.text.isNotEmpty &&
        EmailValidator.validate(mailForResetPass.text)) {
      Indicator.showLoading();
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: mailForResetPass.text.trim());
        Indicator.closeLoading();
        Get.offNamed("/reset-password");
      } catch (e) {
        print(e);
        Get.snackbar("Error", e.toString());
      }
    } else {
      Get.snackbar("Error", "Enter a valid email");
    }
  }
}
