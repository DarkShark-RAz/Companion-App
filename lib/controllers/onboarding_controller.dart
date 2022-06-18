import 'package:companion_app/services/firebase/firebase_functions.dart';
import 'package:companion_app/shared/indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class OnboardingController extends GetxController {
  static OnboardingController get to => Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFunctions _functions = FirebaseFunctions();

  final _isChecked = false.obs;

  get isChecked => this._isChecked.value;

  set isChecked(value) => this._isChecked.value = value;

  final TextEditingController dateInput = TextEditingController(text: "");

  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController getPhone = TextEditingController();

  final TextEditingController priorityTask = TextEditingController();

  final TextEditingController anonymousName = TextEditingController();

  final _phone = ''.obs;

  get phone => this._phone.value;

  set phone(value) => this._phone.value = value;

  final _genderBool = false.obs;

  get genderBool => this._genderBool.value;

  set genderBool(value) => this._genderBool.value = value;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void handleCheckbox() {
    isChecked = !isChecked;
  }

  void onSubmitForm() async {
    if (name.text.isNotEmpty &&
        surname.text.isNotEmpty &&
        getPhone.text.isNotEmpty &&
        dateInput.text.isNotEmpty) {
      if (getPhone.text.length < 10) {
        Get.snackbar("Error", "Phone number should be of 10 digits");
      } else {
        Indicator.showLoading();
        String gender;
        if (!isChecked) {
          gender = genderBool ? 'Male' : 'Female';
        } else {
          gender = 'Not Specified';
        }
        String phoneNumber = phone + ' ' + getPhone.text;
        await _functions
            .storePersonalDetails(
                name.text, surname.text, phoneNumber, gender, dateInput.text)
            .then((value) {
          name.clear();
          surname.clear();
          getPhone.clear();
          dateInput.clear();
          FocusManager.instance.primaryFocus?.unfocus();
        });
      }
    } else {
      Get.snackbar("Error", "All Fields are required");
    }
  }

  void onSubmitPriorityTask() {
    if (priorityTask.text.isNotEmpty) {
      GetStorage().write("taskText", priorityTask.text);
      Get.offAllNamed('/main-screen', arguments: auth.currentUser);
      priorityTask.clear();
    } else {
      Get.snackbar(
          "Can't Submit!", "Please set your priority task for the day!");
    }
  }

  void onSubmitAnonymousName() async {
    if (anonymousName.text.isNotEmpty) {
      Indicator.showLoading();
      await _functions.storeAnonymousName(anonymousName.text).then((value) {
        anonymousName.clear();
        FocusManager.instance.primaryFocus?.unfocus();
      });
    } else {
      Get.snackbar("Can't continue!", "Please select a name for yourself");
    }
  }

  void handleDatePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101),
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    if (pickedDate != null) {
      // print(pickedDate);
      //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat.yMMMMd().format(pickedDate);
      // print(formattedDate);
      //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement
      dateInput.text = formattedDate; //set output date to TextField value.
    } else {
      print("Date is not selected");
    }
  }

  @override
  void onClose() {}
}
