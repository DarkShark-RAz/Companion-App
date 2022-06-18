import 'dart:async';

import 'package:companion_app/constants/constants.dart';
import 'package:companion_app/services/custom_colors.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:companion_app/shared/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({Key? key}) : super(key: key);

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Get.snackbar('verify error', e.toString());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
                      'assets/elements/ThumbsUp.svg',
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
              emailSubtitle,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: CustomColors.appLightGrey,
                    fontFamily: 'JekoBold',
                  ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            isEmailVerified
                ? RoundedButton(
                    text: 'Continue',
                    bgColor: CustomColors.appGreen,
                    onClicked: () {
                      Get.offAllNamed("/onboarding");
                    },
                  )
                : canResendEmail
                    ? RoundedButton(
                        text: 'Resend email',
                        bgColor: CustomColors.appGreen,
                        onClicked: () => sendVerificationEmail(),
                      )
                    : RoundedButton(
                        text: 'Resend email',
                        bgColor: CustomColors.appGreen.withOpacity(0.25),
                        onClicked: () {},
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
