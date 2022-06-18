import 'package:companion_app/controllers/onboarding_controller.dart';
import 'package:companion_app/services/custom_colors.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:companion_app/shared/rounded_button.dart';
import 'package:companion_app/shared/textbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sliding_switch/sliding_switch.dart';

class PersonalDetails extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: SizeConfig.safeVertical! * 0.17,
            backgroundColor: Colors.transparent,
            leading: Align(
              alignment: Alignment.topLeft,
              child: const BackButton(color: Colors.black),
            ),
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back, color: Colors.black),
            //   onPressed: () => Navigator.of(context).pop(),
            // ),
            elevation: 0,
            centerTitle: true,
            flexibleSpace: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Tell us about\n yourself',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBold',
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
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
        ],
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeHorizontal! * .06,
                ),
                child: Column(
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(
                          0.0, SizeConfig.safeVertical! * -0.025, 0.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Let\'s get acquainted',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: CustomColors.appLightGrey,
                              fontFamily: 'JekoBold',
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // SizedBox(
                    //   height: SizeConfig.safeVertical! * 0.02,
                    // ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your name',
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
                      placeholder: 'Enter your name',
                      controller: controller.name,
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * 0.02,
                    ),
                    TextBox(
                      placeholder: 'Enter your surname',
                      controller: controller.surname,
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * 0.03,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Phone number',
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
                    IntlPhoneField(
                      controller: controller.getPhone,
                      autovalidateMode: AutovalidateMode.disabled,
                      showDropdownIcon: false,
                      flagsButtonPadding: EdgeInsets.only(
                          left: SizeConfig.safeHorizontal! * 0.04),
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Phone Number',
                        hintStyle:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: CustomColors.appDarkGrey,
                                  fontFamily: 'JekoRegular',
                                ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CustomColors.appLightGrey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CustomColors.appLightGrey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (value) {
                        controller.phone = value.countryCode;
                      },
                    ),

                    SizedBox(
                      height: SizeConfig.safeVertical! * 0.03,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Gender',
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
                    Obx(
                      () => Visibility(
                        visible: !controller.isChecked,
                        child: SlidingSwitch(
                          value: controller.genderBool,
                          width: SizeConfig.safeHorizontal! * 0.85,
                          onChanged: (bool value) {
                            controller.genderBool = value;
                          },
                          height: SizeConfig.safeVertical! * 0.06,
                          animationDuration: const Duration(milliseconds: 100),
                          onTap: () {},
                          onDoubleTap: () {},
                          onSwipe: () {},
                          textOff: "Female",
                          textOn: "Male",
                          colorOn: Colors.white,
                          colorOff: Colors.white,
                          background: CustomColors.appSecondaryGrey,
                          buttonColor: CustomColors.appGreen,
                          inactiveColor: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * 0.005,
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.isChecked,
                            fillColor: MaterialStateProperty.all(
                                CustomColors.appGreen),
                            onChanged: (bool? value) =>
                                controller.handleCheckbox(),
                          ),
                        ),
                        Text(
                          'Don\'t want to disclose',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: CustomColors.appLightGrey,
                                    fontFamily: 'JekoBold',
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * 0.01,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Date of birth',
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
                    TextField(
                      controller: controller.dateInput,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CustomColors.appLightGrey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CustomColors.appLightGrey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: const Icon(Icons.calendar_today),
                        hintText: "Enter Date",
                        hintStyle:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: CustomColors.appDarkGrey,
                                  fontFamily: 'JekoRegular',
                                ),
                      ),
                      readOnly: true,
                      //set it true, so that user will not able to edit text
                      onTap: () async => controller.handleDatePicker(context),
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * 0.06,
                    ),
                    RoundedButton(
                      text: "Continue",
                      bgColor: CustomColors.appGreen,
                      onClicked: () {
                        controller.onSubmitForm();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
