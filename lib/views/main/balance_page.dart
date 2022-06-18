import 'package:companion_app/services/size_config.dart';
import 'package:companion_app/shared/shadow_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BalancePage extends StatelessWidget {
  const BalancePage({Key? key}) : super(key: key);

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
          flexibleSpace: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/memphis.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.safeHorizontal! * 0.07),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    'assets/text/maintain-balance.svg',
                    fit: BoxFit.contain,
                    width: SizeConfig.safeHorizontal! * 0.8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.safeVertical! * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShadowBox(
                  ht: SizeConfig.safeVertical! * .18,
                  wd: SizeConfig.safeVertical! * .18,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/elements/lungs.svg',
                          fit: BoxFit.contain,
                          height: SizeConfig.safeVertical! * 0.09,
                        ),
                        SizedBox(
                          height: SizeConfig.safeVertical! * .001,
                        ),
                        Text(
                          "Breathing \nExercise",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontFamily: 'JekoBlack',
                                  ),
                        ),
                      ],
                    ),
                  ),
                  onClicked: () {},
                ),
                ShadowBox(
                  ht: SizeConfig.safeVertical! * 0.18,
                  wd: SizeConfig.safeVertical! * 0.18,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/elements/yoga.svg',
                          fit: BoxFit.contain,
                          height: SizeConfig.safeVertical! * 0.07,
                        ),
                        SizedBox(
                          height: SizeConfig.safeVertical! * .02,
                        ),
                        Text(
                          "Yoga",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontFamily: 'JekoBlack',
                                  ),
                        ),
                      ],
                    ),
                  ),
                  onClicked: () {},
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShadowBox(
                  ht: SizeConfig.safeVertical! * 0.18,
                  wd: SizeConfig.safeVertical! * 0.18,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/elements/lotus.svg',
                          fit: BoxFit.contain,
                          height: SizeConfig.safeVertical! * 0.08,
                        ),
                        Text(
                          "Self-Care",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontFamily: 'JekoBlack',
                                  ),
                        ),
                      ],
                    ),
                  ),
                  onClicked: () {},
                ),
                ShadowBox(
                  ht: SizeConfig.safeVertical! * 0.18,
                  wd: SizeConfig.safeVertical! * 0.18,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/elements/music.svg',
                          fit: BoxFit.contain,
                          height: SizeConfig.safeVertical! * 0.07,
                        ),
                        SizedBox(
                          height: SizeConfig.safeVertical! * .01,
                        ),
                        Text(
                          "Music &\nPodcasts",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontFamily: 'JekoBlack',
                                  ),
                        ),
                      ],
                    ),
                  ),
                  onClicked: () {},
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShadowBox(
                  ht: SizeConfig.safeVertical! * 0.18,
                  wd: SizeConfig.safeVertical! * 0.18,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/elements/journal.svg',
                          fit: BoxFit.contain,
                          height: SizeConfig.safeVertical! * 0.065,
                        ),
                        SizedBox(
                          height: SizeConfig.safeVertical! * .01,
                        ),
                        Text(
                          "Journalling",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontFamily: 'JekoBlack',
                                  ),
                        ),
                      ],
                    ),
                  ),
                  onClicked: () {},
                ),
                ShadowBox(
                  ht: SizeConfig.safeVertical! * 0.18,
                  wd: SizeConfig.safeVertical! * 0.18,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/elements/meditation.svg',
                          fit: BoxFit.contain,
                          height: SizeConfig.safeVertical! * 0.07,
                        ),
                        SizedBox(
                          height: SizeConfig.safeVertical! * .01,
                        ),
                        Text(
                          "Meditation",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontFamily: 'JekoBlack',
                                  ),
                        ),
                      ],
                    ),
                  ),
                  onClicked: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
