import 'package:companion_app/controllers/survey_controller.dart';
import 'package:companion_app/services/custom_colors.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:companion_app/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';

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
              () => IntervalProgressBar(
                direction: IntervalProgressDirection.horizontal,
                max: 6,
                progress: controller.nightProgressNum,
                intervalSize: 5,
                size: Size(SizeConfig.safeHorizontal! * 0.8,
                    SizeConfig.safeVertical! * 0.02),
                highlightColor: Colors.black,
                defaultColor: CustomColors.appLightGrey,
                intervalColor: Colors.transparent,
                intervalHighlightColor: Colors.transparent,
                radius: 20,
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
              onClicked: () => controller.updateNightProgressNumber(),
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
