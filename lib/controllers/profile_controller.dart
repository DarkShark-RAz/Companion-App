import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _name = ''.obs;

  get name => this._name.value;

  set name(value) => this._name.value = value;

  final _email = ''.obs;

  get email => this._email.value;

  set email(value) => this._email.value = value;

  final _username = ''.obs;

  get username => this._username.value;

  set username(value) => this._username.value = value;

  final _dob = ''.obs;

  get dob => this._dob.value;

  set dob(value) => this._dob.value = value;

  final _gender = ''.obs;

  get gender => this._gender.value;

  set gender(value) => this._gender.value = value;

  final _phone = ''.obs;

  get phone => this._phone.value;

  set phone(value) => this._phone.value = value;

  final _surname = ''.obs;

  get surname => this._surname.value;

  set surname(value) => this._surname.value = value;

  Future<void> fetchUserDetails() async {
    try {
      var snapshot = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      Map<String, dynamic> data = snapshot.data()!;

      // print('^^^^^^^^^^ ${data}');

      name = data['name'] ?? '';
      email = data['email'];
      username = data['username'] ?? '';
      dob = data['dob'] ?? '';
      gender = data['gender'] ?? '';
      phone = data['phone'] ?? '';
      surname = data['surname'] ?? '';

      update();
    } catch (e) {
      Get.snackbar('Something went wrong', e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchUserDetails();
    update();
  }

  @override
  void onClose() {}
}
