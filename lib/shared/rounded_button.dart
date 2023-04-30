import 'package:companion_app_nihar/services/size_config.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final VoidCallback onClicked;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.bgColor,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ElevatedButton(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Colors.white, fontFamily: 'JekoBold'),
      ),
      style: ElevatedButton.styleFrom(
        primary: bgColor,
        elevation: 0,
        fixedSize: Size(
            SizeConfig.safeHorizontal! * .85, SizeConfig.safeVertical! * .065),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      onPressed: onClicked,
    );
  }
}
