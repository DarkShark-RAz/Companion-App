import 'package:companion_app_nihar/services/lifecycle_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainScreenController extends GetxController {
  static MainScreenController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(new LifecycleEventHandler(
        resumeCallBack: () async => refreshContent()));
  }

  void refreshContent() {
    String date = GetStorage().read("prevDate");
    DateTime dateTime = DateTime.parse(date).toLocal();
    var currentDay = DateTime.now().day;

    if (dateTime.day != currentDay) {
      Get.offNamed('/priority-task');
    }
  }

  final _tabIndex = 0.obs;
  get tabIndex => this._tabIndex.value;
  set tabIndex(value) => this._tabIndex.value = value;

  @override
  void onReady() {
    super.onReady();
    GetStorage().write("prevDate", DateTime.now().toUtc().toIso8601String());
  }

  void changeTabIndex(int index) {
    tabIndex = index;
  }

  @override
  void onClose() {}
}
