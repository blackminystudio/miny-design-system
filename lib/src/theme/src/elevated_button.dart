import 'package:flutter/material.dart';
import 'package:miny_design_system/packages/figma_squircle/figma_squircle.dart';

final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Color(0xff1F1E24)),
    // backgroundColor: WidgetStateProperty.resolveWith<Color>(
    //   (states) {
    //     if (states.contains(WidgetState.pressed)) {
    //       return Color(0xff757376);
    //     }
    //     return Color(0xff1F1E24);
    //   },
    // ),
    elevation: WidgetStateProperty.all(0),
    enableFeedback: true,
    minimumSize: WidgetStateProperty.all(
      Size(double.infinity, 55),
    ),
    overlayColor: WidgetStateProperty.all(Color(0xff7F7D80)),
    splashFactory: InkRipple.splashFactory,
    shape: WidgetStateProperty.all(
      SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: 15,
          cornerSmoothing: 1,
        ),
      ),
    ),
    foregroundColor: WidgetStateProperty.all(Color(0xFFFFFFFF)),
  ),
);
