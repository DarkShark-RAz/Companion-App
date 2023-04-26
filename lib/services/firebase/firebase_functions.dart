import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:companion_app/shared/indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseFunctions {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUserCredential(String email, {String? name}) async {
    try {
      final snapshot = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        Indicator.closeLoading();
        Get.snackbar(
            'Error', 'Email address already in use by another account');
      } else {
        await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .set({
          "uid": _auth.currentUser!.uid,
          "email": email,
          "timestamp": Timestamp.fromDate(DateTime.now())
        }).then((value) {
          Indicator.closeLoading();
        });
      }
    } catch (e) {
      Get.snackbar('Something went wrong', e.toString());
    }
  }

  Future<void> createUserCredentialForGoogleSignUp(
      String email, String name) async {
    try {
      final snapshot = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        Indicator.closeLoading();
      } else {
        await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .set({
          "uid": _auth.currentUser!.uid,
          "name": name,
          "email": email,
          "timestamp": Timestamp.fromDate(DateTime.now())
        }).then((value) {
          Indicator.closeLoading();
        });
      }
    } catch (e) {
      Get.snackbar('Something went wrong', e.toString());
    }
  }

  Future<bool> checkIfDetailsExist() async {
    var snapshot = await _firebaseFirestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get();
    Map<String, dynamic> data = snapshot.data() ?? {};

    if (data['phone'] != null || data['username'] != null) {
      print('Details Exist!');
      return true;
    } else {
      return false;
    }
  }

  Future<void> storePersonalDetails(String name, String surname, String phone,
      String gender, String dob) async {
    try {
      var snapshot = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      Map<String, dynamic> data = snapshot.data()!;

      if (data['phone'] != null) {
        Indicator.closeLoading();
        Get.snackbar('Warning', 'Details already filled');
      } else {
        await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .update({
          "name": name,
          "surname": surname,
          "phone": phone,
          "gender": gender,
          "dob": dob,
          "timestamp": Timestamp.fromDate(DateTime.now())
        }).then((value) {
          Indicator.closeLoading();
          Get.toNamed('/survey-intro');
        });
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Something went wrong', e.toString());
    }
  }

  Future<void> storeAnonymousName(String username) async {
    try {
      var snapshot = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      Map<String, dynamic> data = snapshot.data()!;

      if (data['username'] != null) {
        Indicator.closeLoading();
        Get.snackbar('Warning', 'Details already filled');
      } else {
        await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .update({
          "username": username,
          "timestamp": Timestamp.fromDate(DateTime.now())
        }).then((value) {
          Indicator.closeLoading();
          Get.toNamed('/survey-intro');
        });
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Something went wrong', e.toString());
    }
  }
}
