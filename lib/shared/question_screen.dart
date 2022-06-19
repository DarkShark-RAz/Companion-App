import 'package:companion_app/controllers/survey_controller.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:companion_app/shared/shadow_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class QuestionScreen extends StatelessWidget {
  final String svgPath;
  final Widget child0;
  final Widget child1;
  final Widget child2;
  final Widget child3;
  final VoidCallback onTap0;
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback onTap3;

  const QuestionScreen({
    Key? key,
    required this.svgPath,
    required this.child0,
    required this.child1,
    required this.child2,
    required this.child3,
    required this.onTap0,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.safeVertical! * 0.01,
        ),
        Center(
          child: SvgPicture.asset(
            svgPath,
            fit: BoxFit.contain,
            // height: SizeConfig.safeVertical! * 0.1,
            width: SizeConfig.safeHorizontal! * 0.85,
          ),
        ),
        SizedBox(
          height: SizeConfig.safeVertical! * 0.07,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => ShadowBox(
                ht: SizeConfig.safeVertical! * .18,
                wd: SizeConfig.safeVertical! * .18,
                isSelected: SurveyController.to.isCard0Selected,
                child: Center(
                  child: child0,
                ),
                onClicked: onTap0,
              ),
            ),
            Obx(
              () => ShadowBox(
                ht: SizeConfig.safeVertical! * .18,
                wd: SizeConfig.safeVertical! * .18,
                isSelected: SurveyController.to.isCard1Selected,
                child: Center(
                  child: child1,
                ),
                onClicked: onTap1,
              ),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.safeVertical! * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => ShadowBox(
                ht: SizeConfig.safeVertical! * .18,
                wd: SizeConfig.safeVertical! * .18,
                isSelected: SurveyController.to.isCard2Selected,
                child: Center(
                  child: child2,
                ),
                onClicked: onTap2,
              ),
            ),
            Obx(
              () => ShadowBox(
                ht: SizeConfig.safeVertical! * .18,
                wd: SizeConfig.safeVertical! * .18,
                isSelected: SurveyController.to.isCard3Selected,
                child: Center(
                  child: child3,
                ),
                onClicked: onTap3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
