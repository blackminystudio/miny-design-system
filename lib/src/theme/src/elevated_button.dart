import 'package:flutter/material.dart';

import '../../../miny_design_system.dart';

final _theme = ThemeData();
final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    minimumSize: WidgetStateProperty.all(
      Size(
        double.infinity,
        _theme.sizing.height.s14,
      ),
    ),
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          // TODO: DS: Token Disabled Color
          return const Color(0xff757376);
        }
        return _theme.colors.neutralBackground;
      },
    ),
    foregroundColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          // TODO: DS: Token Disabled Color
          return const Color(0xffB5B5B5);
        }
        return _theme.colors.neutralLight;
      },
    ),
    enableFeedback: true,
    elevation: WidgetStateProperty.all(0),
    overlayColor: WidgetStateProperty.all(const Color(0xff7F7D80)),
    splashFactory: InkRipple.splashFactory,
    shape: WidgetStateProperty.all(
      SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerSmoothing: 1,
          cornerRadius: _theme.borderradius.medium,
        ),
      ),
    ),
  ),
);
