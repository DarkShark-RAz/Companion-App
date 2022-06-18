import 'package:companion_app/services/custom_colors.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final bool isPassword;

  const TextBox(
      {Key? key,
      required this.placeholder,
      required this.controller,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      obscureText: isPassword,
      maxLength: 100,
      controller: controller,
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
        hintText: placeholder,
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
    );
  }
}
