import 'package:flutter/material.dart';
import 'package:miny_design_system/miny_design_system.dart';

final _theme = ThemeData();

final inputDecoration = InputDecorationTheme(
  contentPadding: EdgeInsets.symmetric(
    vertical: _theme.spacing.height.s20,
    horizontal: _theme.spacing.width.s24,
  ),
  hintStyle: _theme.textStyle.bodyMedium.copyWith(
    color: _theme.colors.textSecondarylight,
  ),
  labelStyle: _theme.textStyle.bodyMedium.copyWith(
    color: _theme.colors.textSecondarylight,
  ),
  border: _squircleBorder,
  enabledBorder: _squircleBorder,
  focusedBorder: _squircleBorder,
  errorBorder: _squircleBorder,
  disabledBorder: _squircleBorder,
  focusedErrorBorder: _squircleBorder,
);

final _squircleBorder = SmoothInputBorder(
  border: SmoothRectangleBorder(
    side: BorderSide(
      // TODO: Color Token
      color: Color(0xffE7E5E7),
      width: _theme.sizing.width.half,
    ),
    borderRadius: SmoothBorderRadius(
      cornerRadius: _theme.borderradius.medium,
      cornerSmoothing: 1,
    ),
    borderAlign: BorderAlign.inside,
  ),
);
