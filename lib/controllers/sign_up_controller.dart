import 'package:companion_app/controllers/auth_controller.dart';
import 'package:companion_app/services/firebase/firebase_auth.dart';
import 'package:companion_app/services/firebase/firebase_functions.dart';
import 'package:companion_app/shared/indicator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();
  final FirebaseAuthentication _authentication = FirebaseAuthentication();
  final FirebaseFunctions _functions = FirebaseFunctions();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

  AuthController authController = Get.find<AuthController>();

  var isLoggedInThroughEmail = false.obs;

  void onCreateAccount() async {
    if (email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPass.text.isNotEmpty) {
      if (!EmailValidator.validate(email.text)) {
        Get.snackbar("Error", "Enter a valid email");
      } else if (password.text.length < 8) {
        Get.snackbar("Error", "Enter minimum 8 characters for password");
      } else if (password.text != confirmPass.text) {
        Get.snackbar("Error", "Password & Confirm Password are different");
        print("Password & Confirm Password are different");
      } else {
        Indicator.showLoading();
        isLoggedInThroughEmail.value = true;
        await _authentication
            .createAccount(email.text, password.text)
            .then((value) {
          _functions.createUserCredential(email.text);
        }).then((value) {
          email.clear();
          password.clear();
          confirmPass.clear();
          FocusManager.instance.primaryFocus?.unfocus();
        });
      }
    } else {
      Get.snackbar("Error", "All Fields are required");
      print("All fields are required");
    }
  }

  void signUpWithGoogle() async {
    Indicator.showLoading();
    GoogleSignInAccount? googleSignInAccount =
        await authController.googleSign.signIn();
    if (googleSignInAccount == null) {
      Indicator.closeLoading();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await authController.auth.signInWithCredential(oAuthCredential);
      await _functions.createUserCredentialForGoogleSignUp(
        authController.auth.currentUser!.email!,
        authController.auth.currentUser!.displayName!,
      );
      Indicator.closeLoading();
      final flag = await _functions.checkIfDetailsExist();
      if (!flag) {
        Get.offAllNamed("/onboarding");
      }
    }
  }

  void signOutWithGoogle() async {
    // await authController.googleSign.disconnect();
    await authController.auth.signOut();
  }
}
