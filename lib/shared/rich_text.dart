import 'package:companion_app/services/custom_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextEditor extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final VoidCallback onClicked;

  const RichTextEditor({
    Key? key,
    required this.primaryText,
    required this.secondaryText,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: primaryText,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.black,
                  fontFamily: 'JekoBold',
                ),
          ),
          TextSpan(
            text: secondaryText,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: CustomColors.appGreen,
                  fontFamily: 'JekoBold',
                ),
            recognizer: TapGestureRecognizer()..onTap = onClicked,
          ),
        ],
      ),
    );
  }
}
