import 'package:companion_app/controllers/sign_up_controller.dart';
import 'package:companion_app/services/firebase/firebase_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFunctions _functions = FirebaseFunctions();
  late GoogleSignIn googleSign;
  var isSignIn = false.obs;

  @override
  void onReady() async {
    googleSign = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await auth.currentUser != null;
    auth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });

    super.onReady();
  }

  void handleAuthStateChanged(isLoggedIn) async {
    if (isLoggedIn) {
      if (SignUpController.to.isLoggedInThroughEmail.value) {
        Get.offNamed('/email-verify');
      } else {
        if (GetStorage().read("taskText") == '') {
          Get.offNamed('/priority-task');
        } else {
          final flag = await _functions.checkIfDetailsExist();
          if (!flag) {
            Get.offAllNamed("/onboarding");
          } else {
            Get.offAllNamed('/main-screen', arguments: auth.currentUser);
          }
        }
      }
    } else {
      Get.offAllNamed('/');
    }
  }
}
