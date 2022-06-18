import 'package:carousel_slider/carousel_slider.dart';
import 'package:companion_app/controllers/home_controller.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:companion_app/shared/shadow_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/custom_colors.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _firstname = FirebaseAuth.instance.currentUser?.displayName == null
        ? 'buddy'
        : FirebaseAuth.instance.currentUser?.displayName?.split(" ")[0];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            // expandedHeight: SizeConfig.safeVertical! * 0.17,
            toolbarHeight: SizeConfig.safeVertical! * 0.15,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            flexibleSpace: Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeHorizontal! * 0.05,
                      top: SizeConfig.safeVertical! * 0.1),
                  child: Text(
                    'Hello, ${_firstname![0].toUpperCase() + _firstname.substring(1)}!',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black,
                          fontFamily: 'JekoBold',
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/memphis.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, SizeConfig.safeVertical! * -0.03, 0.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeHorizontal! * 0.05),
                    child: Wrap(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: Colors.transparent, width: 3.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0XFF7C7C7C).withOpacity(0.28),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(
                            SizeConfig.safeHorizontal! * 0.02,
                            SizeConfig.safeVertical! * 0.012,
                            SizeConfig.safeHorizontal! * 0.02,
                            SizeConfig.safeVertical! * 0.02,
                          ),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: SizeConfig.safeVertical! * 0.005),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: SvgPicture.asset(
                                    "assets/elements/quote.svg",
                                    fit: BoxFit.contain,
                                    height: SizeConfig.safeVertical! * 0.02),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Obx(
                                  () => Expanded(
                                    child: Text(
                                      controller.quote.value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                            fontFamily: 'JekoBold',
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.safeVertical! * 0.02,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.001,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.safeHorizontal! * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Today's top priority",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: CustomColors.appLightGrey,
                            fontFamily: 'JekoBold',
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeHorizontal! * 0.05),
                  child: Wrap(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: Colors.transparent, width: 3.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0XFF7C7C7C).withOpacity(0.28),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(
                          SizeConfig.safeHorizontal! * 0.02,
                          SizeConfig.safeVertical! * 0.012,
                          SizeConfig.safeHorizontal! * 0.02,
                          SizeConfig.safeVertical! * 0.012,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: SizeConfig.safeHorizontal! * 0.01,
                              ),
                              child: SvgPicture.asset(
                                  "assets/elements/goals.svg",
                                  fit: BoxFit.contain,
                                  height: SizeConfig.safeVertical! * 0.04),
                            ),
                            SizedBox(
                              width: SizeConfig.safeHorizontal! * 0.01,
                            ),
                            Container(
                              width: SizeConfig.safeHorizontal! * 0.7,
                              child: Text(
                                GetStorage().read("taskText")?.trim() ??
                                    'Achieve all your goals!',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontFamily: 'JekoBold',
                                      color: Colors.black,
                                      fontSize: SizeConfig.safeVertical! * 0.02,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.02,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.safeHorizontal! * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Task List",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: CustomColors.appLightGrey,
                            fontFamily: 'JekoBold',
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.02,
                ),
                ShadowBox(
                    ht: SizeConfig.safeVertical! * 0.1,
                    wd: SizeConfig.safeHorizontal! * 0.9,
                    isShadow: false,
                    child: Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.safeHorizontal! * 0.05,
                        ),
                        Text(
                          "TaskList For your chores!!!",
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontFamily: 'JekoBold',
                                    color: Colors.black,
                                    fontSize: SizeConfig.safeVertical! * 0.02,
                                  ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.safeHorizontal! * 0.05),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FloatingActionButton(
                              heroTag: "btn2",
                              onPressed: () {
                                Get.toNamed("/task-list");
                              },
                              child: Icon(Icons.add),
                              mini: true,
                            ),
                          ),
                        )
                      ],
                    ),
                    onClicked: () {}),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.02,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.safeHorizontal! * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Browse Sessions",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: CustomColors.appLightGrey,
                            fontFamily: 'JekoBold',
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.02,
                ),
                Obx(
                  () => CarouselSlider.builder(
                    options: CarouselOptions(
                      // autoPlay: true,
                      // autoPlayInterval: Duration(seconds: 3),
                      // autoPlayAnimationDuration: Duration(milliseconds: 800),
                      // autoPlayCurve: Curves.fastOutSlowIn,
                      // enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.horizontal,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      height: SizeConfig.safeVertical! * 0.2,
                    ),
                    itemCount: controller.snippetList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: CustomColors.appSecondaryGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              "https://www.youtube.com/watch?v=${controller.snippetList[itemIndex].resourceId!.videoId}"));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            controller
                                .snippetList[itemIndex].thumbnails!.high!.url!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.02,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.safeHorizontal! * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Recommended",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: CustomColors.appLightGrey,
                            fontFamily: 'JekoBold',
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ShadowBox(
                  ht: SizeConfig.safeVertical! * 0.12,
                  wd: SizeConfig.safeHorizontal! * 0.9,
                  isShadow: false,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          "assets/elements/2min.svg",
                          fit: BoxFit.contain,
                          height: SizeConfig.safeVertical! * 0.03,
                          // width: SizeConfig.safeHorizontal! * 0.02,
                        ),
                        //
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Nightly Checkin",
                              // textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    fontFamily: 'JekoBold',
                                    color: Colors.black,
                                    fontSize: SizeConfig.safeVertical! * 0.025,
                                  ),
                            ),
                            Text(
                              "To keep track of \n your healthy habits",
                              // textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    fontFamily: 'JekoBold',
                                    color: CustomColors.appLightGrey,
                                    fontSize: SizeConfig.safeVertical! * 0.015,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                            // width: SizeConfig.safeHorizontal! * 0.05,
                            ),
                        SvgPicture.asset(
                          "assets/elements/checkin.svg",
                          fit: BoxFit.contain,
                          height: SizeConfig.safeVertical! * 0.04,
                          // width: SizeConfig.safeHorizontal! * 0.001,
                        ),
                        SizedBox(
                          width: SizeConfig.safeHorizontal! * 0.002,
                        ),
                      ]),
                  onClicked: () {
                    Get.toNamed('/night-checkin-intro');
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
