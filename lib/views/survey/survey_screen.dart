import 'package:companion_app/controllers/survey_controller.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:companion_app/shared/question_screen.dart';
import 'package:companion_app/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:intervalprogressbar/intervalprogressbar.dart';

class SurveyScreen extends GetView<SurveyController> {
  const SurveyScreen({Key? key}) : super(key: key);

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
            child: Obx(() => CircularProgressIndicator()
                // IntervalProgressBar(
                //   direction: IntervalProgressDirection.horizontal,
                //   max: 9,
                //   progress: controller.progressNum,
                //   intervalSize: 5,
                //   size: Size(SizeConfig.safeHorizontal! * 0.85,
                //       SizeConfig.safeVertical! * 0.02),
                //   highlightColor: Colors.black,
                //   defaultColor: CustomColors.appLightGrey,
                //   intervalColor: Colors.transparent,
                //   intervalHighlightColor: Colors.transparent,
                //   radius: 20,
                // ),
                ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => QuestionScreen(
                child0: Text(
                  'Not\nat all',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBlack',
                      ),
                  textAlign: TextAlign.center,
                ),
                child1: Text(
                  'On\nSeveral\ndays',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBlack',
                      ),
                  textAlign: TextAlign.center,
                ),
                child2: Center(
                  child: Text(
                    'More\nthan half\nthe days',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.black,
                          fontFamily: 'JekoBlack',
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                child3: Text(
                  'Nearly\nevery day',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBlack',
                      ),
                  textAlign: TextAlign.center,
                ),
                svgPath: 'assets/text/question-${controller.progressNum}.svg',
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
              onClicked: () => controller.updateProgressNumber(),
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
