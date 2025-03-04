import 'package:flutter/material.dart';
import 'package:miny_design_system/src/theme/src/chip.dart';
import 'package:miny_design_system/src/theme/src/elevated_button.dart';
import 'package:miny_design_system/src/theme/src/progress_indicator.dart';

class MinyTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      chipTheme: chipThemeData,
      indicatorColor: Colors.white,
      elevatedButtonTheme: elevatedButtonThemeData,
      progressIndicatorTheme: progressIndicatorThemeData,
    );
  }
}
