import 'package:companion_app/constants/constants.dart';
import 'package:companion_app/controllers/onboarding_controller.dart';
import 'package:companion_app/services/custom_colors.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:companion_app/shared/shadow_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class onBoarding extends GetView<OnboardingController> {
  const onBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.safeVertical! * 0.17),
        child: AppBar(
          backgroundColor: Colors.transparent,
          leading: const BackButton(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          flexibleSpace: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/memphis.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  'assets/text/get-started.svg',
                  fit: BoxFit.contain,
                  width: SizeConfig.safeHorizontal! * 0.6,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.safeVertical! * .06,
            ),
            Center(
              child: ShadowBox(
                ht: SizeConfig.safeVertical! * .28,
                wd: SizeConfig.safeHorizontal! * .75,
                onClicked: () => Get.toNamed("/personal-details"),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/elements/user.svg',
                      fit: BoxFit.contain,
                      height: SizeConfig.safeVertical! * 0.09,
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * .03,
                    ),
                    Text(
                      shareTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontFamily: 'JekoBlack',
                          ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * .005,
                    ),
                    Text(
                      shareSubtitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontFamily: 'JekoBold',
                            color: CustomColors.appLightGrey,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * .06,
            ),
            Center(
              child: ShadowBox(
                ht: SizeConfig.safeVertical! * .28,
                wd: SizeConfig.safeHorizontal! * .75,
                onClicked: () => Get.toNamed("/anonymous"),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/elements/anonymous.svg',
                      fit: BoxFit.contain,
                      height: SizeConfig.safeVertical! * 0.11,
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * .02,
                    ),
                    Text(
                      anoy,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontFamily: 'JekoBlack',
                          ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
