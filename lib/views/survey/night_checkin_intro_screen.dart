import 'package:companion_app/constants/constants.dart';
import 'package:companion_app/services/custom_colors.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:companion_app/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NightCheckinIntroScreen extends StatelessWidget {
  const NightCheckinIntroScreen({Key? key}) : super(key: key);

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
                        EdgeInsets.only(top: SizeConfig.safeVertical! * 0.1),
                    child: SvgPicture.asset(
                      'assets/elements/moon.svg',
                      fit: BoxFit.contain,
                      height: SizeConfig.safeVertical! * 0.2,
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
                  'Nightly Check-In',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBold',
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeHorizontal! * 0.07,
              ),
              child: Text(
                nightIntroText,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
                Get.toNamed("/night-checkin");
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
