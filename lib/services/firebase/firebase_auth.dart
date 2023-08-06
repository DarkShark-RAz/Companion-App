import 'package:companion_app_nihar/shared/indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createAccount(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Indicator.closeLoading();
      Get.offAllNamed('/main-screen', arguments: _auth.currentUser);
    } catch (e) {
      print(e);
      Indicator.closeLoading();
      Get.snackbar("Something went wrong", e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut().then((value) {
        Get.toNamed("/");
      });
    } catch (e) {
      print(e);
    }
  }
}
