import 'package:companion_app/constants/constants.dart';
import 'package:companion_app/services/custom_colors.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:companion_app/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

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
                Center(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.safeVertical! * 0.2),
                    child: SvgPicture.asset(
                      'assets/elements/Key.svg',
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
            Text(
              'Check your email',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.black,
                    fontFamily: 'JekoBold',
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.02,
            ),
            Text(
              resetPasswordSubtitle,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: CustomColors.appLightGrey,
                    fontFamily: 'JekoBold',
                  ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            RoundedButton(
              text: 'Continue',
              bgColor: CustomColors.appGreen,
              onClicked: () {
                Get.toNamed("/log-in");
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
