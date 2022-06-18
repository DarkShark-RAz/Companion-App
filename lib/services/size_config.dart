import 'package:flutter/widgets.dart';

class SizeConfig {
  static double? safeHorizontal;
  static double? safeVertical;

  void init(BuildContext context) {
    safeHorizontal = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left +
        MediaQuery.of(context).padding.right;
    safeVertical = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
  }
}
