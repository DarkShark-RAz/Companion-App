import 'package:companion_app_nihar/controllers/onboarding_controller.dart';
import 'package:companion_app_nihar/services/custom_colors.dart';
import 'package:companion_app_nihar/services/size_config.dart';
import 'package:companion_app_nihar/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PriorityTaskPage extends GetView<OnboardingController> {
  const PriorityTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.safeVertical! * 0.22),
        child: AppBar(
          backgroundColor: Colors.transparent,
          leading: const BackButton(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          flexibleSpace: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/memphis.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  'assets/text/priority-task.svg',
                  fit: BoxFit.contain,
                  width: SizeConfig.safeHorizontal! * 0.85,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeHorizontal! * .1,
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.safeVertical! * .03,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                maxLength: 100,
                controller: controller.priorityTask,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                      fontFamily: 'JekoRegular',
                    ),
                // autofocus: true,
                decoration: InputDecoration(
                  counterText: '',
                  filled: false,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeVertical! * .02,
                      horizontal: SizeConfig.safeHorizontal! * .04),
                  hintText: 'Start typing...',
                  hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: CustomColors.appDarkGrey,
                        fontFamily: 'JekoRegular',
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.appLightGrey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.appLightGrey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Spacer(),
              RoundedButton(
                text: "submit",
                bgColor: Colors.black,
                onClicked: () {
                  controller.onSubmitPriorityTask();
                },
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * .06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
