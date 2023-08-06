import 'package:companion_app_nihar/services/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Indicator {
  static void showLoading() {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(color: CustomColors.appGreen),
      ),
    );
  }

  static void closeLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
