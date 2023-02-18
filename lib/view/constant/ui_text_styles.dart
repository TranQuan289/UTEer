import 'package:flutter/material.dart';
import 'package:uteer/view/constant/ui_colors.dart';

class UITextStyles {
  UITextStyles._();
  static final TextStyle title = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: UIColors.title, fontFamily: 'Serif');
  static final TextStyle hint =
      TextStyle(fontSize: 13, color: UIColors.border, fontFamily: 'Serif');
  static final TextStyle textBlack =
      TextStyle(fontSize: 13, color: UIColors.black, fontFamily: 'Serif');
  static final TextStyle textWhite =
      TextStyle(fontSize: 13, color: UIColors.white, fontFamily: 'Serif');
  static final TextStyle textBlue =
      TextStyle(fontSize: 13, color: UIColors.blue, fontFamily: 'Serif');
}
