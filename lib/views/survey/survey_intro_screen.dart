import 'package:companion_app_nihar/services/custom_colors.dart';
import 'package:companion_app_nihar/services/size_config.dart';
import 'package:companion_app_nihar/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SurveyIntroScreen extends StatelessWidget {
  const SurveyIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/memphis.png',
                  fit: BoxFit.contain,
                ),
                Positioned(
                  left: SizeConfig.safeHorizontal! * 0.01,
                  top: SizeConfig.safeVertical! * 0.005,
                  child: BackButton(color: Colors.black),
                ),
                Center(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.safeVertical! * 0.15),
                    child: SvgPicture.asset(
                      'assets/elements/smile.svg',
                      fit: BoxFit.contain,
                      height: SizeConfig.safeVertical! * 0.25,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.05,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.safeHorizontal! * 0.07,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mental Health Assessment',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBold',
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeHorizontal! * 0.07,
              ),
              child: Text(
                'Lets quickly take this personal health questionnaire before we get started!',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: CustomColors.appLightGrey,
                      fontFamily: 'JekoBold',
                    ),
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            RoundedButton(
              text: 'Continue',
              bgColor: CustomColors.appGreen,
              onClicked: () {
                Get.toNamed('/survey-screen');
              },
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
