import 'package:bombay_running/config/theme/color_constants.dart';
import 'package:flutter/material.dart';

class ColorsParser {
  ColorsParser._();
  static final ColorsParser instance = ColorsParser._();

  Color getColorsFromString(String value) {
    Color color = ColorConstants.white;
    switch (value) {
      case 'green':
        color = ColorConstants.green;
        break;
      case 'red':
        color = ColorConstants.red;
        break;
      default:
        break;
    }
    return color;
  }
}
