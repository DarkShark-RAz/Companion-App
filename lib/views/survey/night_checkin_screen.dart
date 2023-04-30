import 'package:companion_app_nihar/controllers/survey_controller.dart';
import 'package:companion_app_nihar/services/size_config.dart';
import 'package:companion_app_nihar/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../services/custom_colors.dart';
import '../../shared/question_screen.dart';

class NightCheckInScreen extends GetView<SurveyController> {
  const NightCheckInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: SizeConfig.safeVertical! * 0.12,
        flexibleSpace: SafeArea(
          child: Center(
            child: Obx(
              () => SizedBox(
                width: SizeConfig.safeHorizontal! * 0.8,
                height: SizeConfig.safeVertical! * 0.025,
                child: FAProgressBar(
                  direction: Axis.horizontal,
                  maxValue: 6,
                  currentValue:
                      double.parse(controller.nightProgressNum.toString()),
                  progressColor: Colors.black,
                  backgroundColor: CustomColors.appLightGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => QuestionScreen(
                child0: SvgPicture.asset(
                  'assets/elements/object-${controller.nightProgressNum}-0.svg',
                  fit: BoxFit.contain,
                  height: SizeConfig.safeVertical! * 0.11,
                ),
                child1: SvgPicture.asset(
                  'assets/elements/object-${controller.nightProgressNum}-1.svg',
                  fit: BoxFit.contain,
                  height: SizeConfig.safeVertical! * 0.11,
                ),
                child2: SvgPicture.asset(
                  'assets/elements/object-${controller.nightProgressNum}-2.svg',
                  fit: BoxFit.contain,
                  height: SizeConfig.safeVertical! * 0.11,
                ),
                child3: SvgPicture.asset(
                  'assets/elements/object-${controller.nightProgressNum}-3.svg',
                  fit: BoxFit.contain,
                  height: SizeConfig.safeVertical! * 0.11,
                ),
                svgPath:
                    'assets/text/night-question-${controller.nightProgressNum}.svg',
                onTap0: () => controller.Card0Selected(),
                onTap1: () => controller.Card1Selected(),
                onTap2: () => controller.Card2Selected(),
                onTap3: () => controller.Card3Selected(),
              ),
            ),
            Spacer(),
            RoundedButton(
                bgColor: Colors.black,
                text: 'submit',
                onClicked: () => controller.updateNightProgressNumber()),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
