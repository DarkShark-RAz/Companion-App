import 'package:companion_app/constants/constants.dart';
import 'package:companion_app/controllers/sign_up_controller.dart';
import 'package:companion_app/services/custom_colors.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:companion_app/shared/rich_text.dart';
import 'package:companion_app/shared/rounded_button.dart';
import 'package:companion_app/shared/textbox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupPage extends GetView<SignUpController> {
  const SignupPage({Key? key}) : super(key: key);

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
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          flexibleSpace: Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.black,
                      fontFamily: 'JekoBold',
                      fontWeight: FontWeight.bold,
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
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeHorizontal! * .06,
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.safeVertical! * 0.01,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBold',
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.005,
              ),
              TextBox(
                placeholder: 'Enter your email',
                controller: controller.email,
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBold',
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.005,
              ),
              TextBox(
                placeholder: 'Enter your password',
                isPassword: true,
                controller: controller.password,
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              TextBox(
                placeholder: 'Confirm your password',
                isPassword: true,
                controller: controller.confirmPass,
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.05,
              ),
              RoundedButton(
                text: 'Continue',
                bgColor: CustomColors.appGreen,
                onClicked: () {
                  controller.onCreateAccount();
                },
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              Text(
                'OR',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.black,
                      fontFamily: 'JekoBold',
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              RoundedButton(
                text: 'Continue with Google',
                bgColor: Colors.black,
                onClicked: () {
                  controller.signUpWithGoogle();
                },
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.03,
              ),
              RichTextEditor(
                primaryText: already,
                secondaryText: " Log in",
                onClicked: () {
                  Get.toNamed("/log-in");
                },
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.05,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By continuing, you accept the\n',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: CustomColors.appDarkGrey,
                            fontFamily: 'JekoBold',
                          ),
                    ),
                    TextSpan(
                      text: 'Terms of Service',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: CustomColors.appDarkGrey,
                            fontFamily: 'JekoBold',
                            decoration: TextDecoration.underline,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await launchUrl(Uri.parse('https://www.google.com'));
                        },
                    ),
                    TextSpan(
                      text: ' and ',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: CustomColors.appDarkGrey,
                            fontFamily: 'JekoBold',
                          ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: CustomColors.appDarkGrey,
                            fontFamily: 'JekoBold',
                            decoration: TextDecoration.underline,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await launchUrl(Uri.parse('https://www.google.com'));
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
