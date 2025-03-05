import 'package:flutter/material.dart';

import '../../../packages/figma_squircle/figma_squircle.dart';

final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return const Color(0xff757376);
        }
        return const Color(0xff1F1E24);
      },
    ),
    foregroundColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return const Color(0xffB5B5B5);
        }
        return const Color(0xFFFFFFFF);
      },
    ),
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
  ),
);
