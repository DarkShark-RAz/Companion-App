import 'package:companion_app_nihar/services/custom_colors.dart';
import 'package:companion_app_nihar/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarWidget extends StatelessWidget {
  final int index;

  final ValueChanged<int> onChangedTab;

  const BottomBarWidget(
      {required this.index, required this.onChangedTab, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(
        onPressed: null,
        icon: Icon(Icons.no_cell),
      ),
    );

    return BottomAppBar(
      color: Colors.white,
      elevation: 0,
      shape: CircularNotchedRectangle(),
      notchMargin: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(
            index: 0,
            svgIconPath: 'assets/elements/home.svg',
            title: 'Home',
            context: context,
          ),
          buildTabItem(
            index: 1,
            svgIconPath: 'assets/elements/balance.svg',
            title: 'Balance',
            context: context,
          ),
          placeholder,
          buildTabItem(
            index: 2,
            svgIconPath: 'assets/elements/specialist.svg',
            title: 'Specialists',
            context: context,
          ),
          buildTabItem(
            index: 3,
            svgIconPath: 'assets/elements/profile.svg',
            title: 'Profile',
            context: context,
          ),
        ],
      ),
    );
  }

  Widget buildTabItem(
      {required int index,
      required String svgIconPath,
      required String title,
      required BuildContext context}) {
    Color TabColor =
        index == this.index ? Colors.black : CustomColors.appLightGrey;

    return Expanded(
      child: InkWell(
        onTap: () => this.onChangedTab(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.safeVertical! * 0.01,
            ),
            SvgPicture.asset(
              svgIconPath,
              fit: BoxFit.contain,
              height: SizeConfig.safeVertical! * 0.03,
              color: TabColor,
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.005,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: TabColor,
                    fontFamily: 'JekoBold',
                    // fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.008,
            ),
          ],
        ),
      ),
    );
  }
}
