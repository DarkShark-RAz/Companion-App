import 'package:companion_app_nihar/constants/constants.dart';
import 'package:companion_app_nihar/controllers/specialist_controller.dart';
import 'package:companion_app_nihar/services/custom_colors.dart';
import 'package:companion_app_nihar/services/size_config.dart';
import 'package:companion_app_nihar/views/main/single_specialist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class SpecialistPage extends GetView<SpecialistController> {
  SpecialistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // var newSpecialistList = <SpecialistModel>[];
    // for (int i = 0; i < controller.specialistList.length; i++) {
    //   if (controller.calculateInBetweenDist(
    //           controller.specialistList[i].latitude,
    //           controller.specialistList[i].longitude) <
    //       20000) {
    //     newSpecialistList.add(controller.specialistList[i]);
    //   }
    // }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: NestedScrollView(
          // floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              // floating: true,
              // snap: true,
              toolbarHeight: SizeConfig.safeVertical! * 0.2,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                      right: SizeConfig.safeHorizontal! * 0.03,
                      top: SizeConfig.safeVertical! * 0.01),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.black,
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () => _showSingleChoiceDialog(context),
                            child: Text(
                              '${controller.selectedCity[0].toUpperCase() + controller.selectedCity.substring(1)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Colors.black,
                                    fontFamily: 'JekoBlack',
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
              // leading:
              flexibleSpace: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/memphis.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.safeHorizontal! * 0.2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.safeHorizontal! * 0.07),
                        child: SvgPicture.asset(
                          'assets/text/Specialists.svg',
                          fit: BoxFit.contain,
                          width: SizeConfig.safeHorizontal! * 0.6,
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: Container(
                          width: SizeConfig.safeHorizontal! * 0.8,
                          height: SizeConfig.safeVertical! * 0.05,
                          decoration: BoxDecoration(
                            color: Color(0XFFB8F1DF),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TabBar(
                            tabs: [Tab(text: 'Best Matches'), Tab(text: 'All')],
                            labelStyle:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontFamily: 'JekoBlack',
                                    ),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black,
                            unselectedLabelStyle:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontFamily: 'JekoBlack',
                                    ),
                            indicator: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0XFF7C7C7C).withOpacity(0.4),
                                    spreadRadius: 10,
                                    blurRadius: 60,
                                    offset: Offset(20, 10)),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelPadding: EdgeInsets.only(
                                top: SizeConfig.safeVertical! * 0.005),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return false;
            },
            child: TabBarView(
              children: [
                _buildList(key: "key1", flag: false),
                _buildList(key: "key2", flag: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList({required String key, required bool flag}) => Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: CustomColors.appGreen,
                ),
              )
            : ListView.builder(
                key: PageStorageKey(key),
                itemCount: flag ? controller.specialistList.length : 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeHorizontal! * 0.05),
                        child: InkWell(
                          onTap: () {
                            // controller.fetchAddress(index);
                            Get.to(() => SingleSpecialist(), arguments: index);
                          },
                          child: Wrap(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: Colors.transparent, width: 3.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Color(0XFF7C7C7C).withOpacity(0.28),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: SizeConfig.safeVertical! * 0.012,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width:
                                              SizeConfig.safeHorizontal! * 0.03,
                                        ),
                                        GFAvatar(
                                          backgroundImage: NetworkImage(
                                            '${controller.specialistList[index].userimage ?? 'https://via.placeholder.com/150'}',
                                          ),
                                          shape: GFAvatarShape.standard,
                                          size: 50,
                                        ),
                                        SizedBox(
                                          width:
                                              SizeConfig.safeHorizontal! * 0.03,
                                        ),
                                        Expanded(
                                          child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text:
                                                    '${controller.specialistList[index].name ?? ''} ${controller.specialistList[index].surname ?? ''}\n',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(
                                                      color: Colors.black,
                                                      fontFamily: 'JekoBlack',
                                                    ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${controller.specialistList[index].professionaltitles?[0] ?? ''} \n',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                      color:
                                                          CustomColors.appGreen,
                                                      fontFamily: 'JekoBold',
                                                    ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${controller.specialistList[index].searchsuburb ?? ''}, ${controller.specialistList[index].searchprovince ?? ''}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                      color: CustomColors
                                                          .appLightGrey,
                                                      fontFamily: 'JekoBold',
                                                    ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeVertical! * 0.015,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width:
                                              SizeConfig.safeHorizontal! * 0.03,
                                        ),
                                        Text(
                                          'About : ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(
                                                fontFamily: 'JekoRegular',
                                              ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${controller.specialistList[index].someinfo ?? ''}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                  fontFamily: 'JekoThin',
                                                ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeVertical! * 0.013,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeVertical! * 0.03,
                      )
                    ],
                  );
                },
              ),
      );

  _showSingleChoiceDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Select your city',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontFamily: 'JekoBold',
                    fontWeight: FontWeight.bold,
                  ),
            ),
            content: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: cities
                    .map(
                      (city) => Obx(
                        () => RadioListTile(
                          title: Text(
                            '${city[0].toUpperCase() + city.substring(1)}',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontFamily: 'JekoBold',
                                    ),
                          ),
                          value: city,
                          groupValue: controller.selectedCity,
                          selected: controller.selectedCity == city,
                          activeColor: CustomColors.appGreen,
                          onChanged: (value) {
                            controller.updateCity(value.toString());
                            Get.back();
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      );
}
