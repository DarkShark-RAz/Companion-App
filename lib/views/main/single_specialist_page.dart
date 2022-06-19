import 'package:companion_app/controllers/specialist_controller.dart';
import 'package:companion_app/services/custom_colors.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleSpecialist extends GetView<SpecialistController> {
  const SingleSpecialist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    int index = Get.arguments;
    // print('^^^^^^^ ${controller.addressList[0]}');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  Positioned(
                    right: SizeConfig.safeHorizontal! * 0.03,
                    top: SizeConfig.safeVertical! * 0.005,
                    child: IconButton(
                      enableFeedback: true,
                      iconSize: 30,
                      icon: Icon(Icons.phone, color: Colors.black),
                      onPressed: () async {
                        final tel =
                            controller.specialistList[index].officeNumber ??
                                '9876543210';
                        try {
                          await launchUrl(Uri.parse('tel:$tel'));
                        } catch (_e) {
                          print(_e);
                        }
                      },
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: SizeConfig.safeVertical! * 0.1),
                      child: GFAvatar(
                        backgroundImage: NetworkImage(
                          '${controller.specialistList[index].userimage ?? 'https://via.placeholder.com/150'}',
                        ),
                        shape: GFAvatarShape.standard,
                        radius: SizeConfig.safeHorizontal! * 0.2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.015,
              ),
              Text(
                '${controller.specialistList[index].name?.split('-')[0] ?? ''} ${controller.specialistList[index].surname ?? ''}',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontFamily: 'JekoBold',
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.005,
              ),
              Text(
                '${controller.specialistList[index].professionaltitles?[0] ?? ''}',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: CustomColors.appGreen,
                      fontFamily: 'JekoBold',
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeHorizontal! * 0.05),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ListTile(
                    //   leading:
                    Icon(
                      Icons.location_on,
                      size: 30,
                      color: CustomColors.appLightGrey,
                    ),
                    // horizontalTitleGap: SizeConfig.safeHorizontal! * 0.03,
                    // title:
                    Obx(
                      () => Center(
                        child: Text(
                          '${controller.specialistList[index].searchsuburb ?? ''}, ${controller.specialistList[index].searchprovince ?? ''}',
                          // '${controller.addressList[0].street ?? ''} ${controller.addressList[0].subLocality ?? ''}, ${controller.addressList[0].locality ?? ''} ${controller.addressList[0].subAdministrativeArea ?? ''} ${controller.addressList[0].postalCode ?? ''}',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: CustomColors.appLightGrey,
                                    fontFamily: 'JekoBlack',
                                  ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeHorizontal! * .06,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.specialistList[index].agegroups == null
                            ? ''
                            : 'Category : ',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontFamily: 'JekoBlack',
                            ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * 0.01,
                    ),
                    Obx(
                      () => Wrap(
                        alignment: WrapAlignment.center,
                        spacing: SizeConfig.safeHorizontal! * 0.018,
                        runSpacing: SizeConfig.safeVertical! * 0.003,
                        children:
                            controller.specialistList[index].agegroups == null
                                ? []
                                : controller.specialistList[index].agegroups!
                                    .map((age) => _buildChip(context, age))
                                    .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeHorizontal! * .06,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.specialistList[index].someinfo == null
                            ? ''
                            : 'Personal Information : ',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontFamily: 'JekoBlack',
                            ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * 0.01,
                    ),
                    Obx(
                      () => Text(
                        '${controller.specialistList[index].someinfo ?? ''}',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: CustomColors.appLightGrey,
                              fontFamily: 'JekoBold',
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: controller.specialistList[index].services == null
                    ? 0
                    : SizeConfig.safeVertical! * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeHorizontal! * .06,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.specialistList[index].services == null
                            ? ''
                            : 'Specialized in : ',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontFamily: 'JekoBlack',
                            ),
                      ),
                    ),
                    SizedBox(
                      height: controller.specialistList[index].services == null
                          ? 0
                          : SizeConfig.safeVertical! * 0.01,
                    ),
                    Obx(
                      () => Wrap(
                        alignment: WrapAlignment.center,
                        spacing: SizeConfig.safeHorizontal! * 0.018,
                        runSpacing: SizeConfig.safeVertical! * 0.003,
                        children: controller.specialistList[index].services ==
                                null
                            ? []
                            : controller.specialistList[index].services!
                                .map((service) => _buildChip(context, service))
                                .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeHorizontal! * .06,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.specialistList[index].languages == null
                            ? ''
                            : 'Languages known : ',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontFamily: 'JekoBlack',
                            ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * 0.01,
                    ),
                    Obx(
                      () => Wrap(
                        alignment: WrapAlignment.center,
                        spacing: SizeConfig.safeHorizontal! * 0.018,
                        runSpacing: SizeConfig.safeVertical! * 0.003,
                        children:
                            controller.specialistList[index].languages == null
                                ? []
                                : controller.specialistList[index].languages!
                                    .map((lang) => _buildChip(context, lang))
                                    .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, String txt) {
    return Chip(
      label: Text(
        txt,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Colors.white,
              fontFamily: 'JekoBold',
            ),
      ),
      backgroundColor: CustomColors.appGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // side: BorderSide(color: Colors.black12, width: 1),
      shadowColor: Color(0XFF7C7C7C).withOpacity(0.4),
      elevation: 5.0,
      // labelPadding: EdgeInsets.all(5.0),
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeVertical! * .012,
          horizontal: SizeConfig.safeHorizontal! * .02),
    );
  }
}
