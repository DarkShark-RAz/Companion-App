import 'package:companion_app/controllers/main_screen_controller.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:companion_app/shared/bottom_bar_widget.dart';
import 'package:companion_app/views/main/balance_page.dart';
import 'package:companion_app/views/main/home_page.dart';
import 'package:companion_app/views/main/profile_page.dart';
import 'package:companion_app/views/main/specialist_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainScreenController> {
  MainScreen({Key? key}) : super(key: key);

  final pages = <Widget>[
    HomePage(),
    BalancePage(),
    SpecialistPage(),
    ProfilePage(user: Get.arguments),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: pages[controller.tabIndex],
        bottomNavigationBar: BottomBarWidget(
          index: controller.tabIndex,
          onChangedTab: controller.changeTabIndex,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.chat_bubble),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
