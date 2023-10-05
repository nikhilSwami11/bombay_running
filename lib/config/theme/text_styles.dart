import 'package:bombay_running/config/theme/color_constants.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle style16W =
      const TextStyle(color: ColorConstants.white, fontSize: 16);
  static const style10W = TextStyle(color: ColorConstants.white, fontSize: 10);
  static const style14W = TextStyle(color: ColorConstants.white, fontSize: 14);
  static const style14B = TextStyle(color: ColorConstants.black, fontSize: 14);
  static const style12B = TextStyle(color: ColorConstants.black, fontSize: 12);

  static TextStyle style16WU = const TextStyle(
      color: ColorConstants.white,
      fontSize: 16,
      decoration: TextDecoration.underline,
      decorationColor: ColorConstants.white);
  static TextStyle style16BU = const TextStyle(
      color: ColorConstants.hyperLinkBlue,
      fontSize: 16,
      decoration: TextDecoration.underline,
      decorationColor: ColorConstants.hyperLinkBlue);
  static const style10WU = TextStyle(
      color: ColorConstants.white,
      fontSize: 10,
      decoration: TextDecoration.underline,
      decorationColor: ColorConstants.white);
}
