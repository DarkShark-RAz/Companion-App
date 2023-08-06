import 'package:companion_app_nihar/controllers/login_controller.dart';
import 'package:companion_app_nihar/controllers/sign_up_controller.dart';
import 'package:companion_app_nihar/services/custom_colors.dart';
import 'package:companion_app_nihar/services/size_config.dart';
import 'package:companion_app_nihar/shared/rich_text.dart';
import 'package:companion_app_nihar/shared/rounded_button.dart';
import 'package:companion_app_nihar/shared/textbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

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
                'Login',
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
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Get.toNamed("/forgot-password");
                  },
                  child: Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: CustomColors.appGreen,
                          fontFamily: 'JekoBold',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.05,
              ),
              RoundedButton(
                text: 'Login',
                bgColor: CustomColors.appGreen,
                onClicked: () {
                  controller.onLogin();
                },
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              Text(
                SignUpController.to.isLoggedInThroughEmail.value ? '' : 'OR',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.black,
                      fontFamily: 'JekoBold',
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: SignUpController.to.isLoggedInThroughEmail.value
                    ? 0.0
                    : SizeConfig.safeVertical! * 0.02,
              ),
              SignUpController.to.isLoggedInThroughEmail.value
                  ? Container()
                  : RoundedButton(
                      text: 'Continue with Google',
                      bgColor: Colors.black,
                      onClicked: () {
                        SignUpController.to.signUpWithGoogle();
                      },
                    ),
              SizedBox(
                height: SignUpController.to.isLoggedInThroughEmail.value
                    ? 0.0
                    : SizeConfig.safeVertical! * 0.03,
              ),
              RichTextEditor(
                primaryText: "Don't have an account?",
                secondaryText: " Sign up",
                onClicked: () {
                  Get.toNamed("/sign-up");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
