import 'package:flutter/material.dart';
import 'package:miny_design_system/miny_design_system.dart';

final chipThemeData = ChipThemeData(
  showCheckmark: false,
  padding: EdgeInsets.symmetric(
    vertical: theme.spacing.s16,
    horizontal: theme.spacing.s40,
  ),
  labelPadding: EdgeInsets.zero,
  selectedColor: theme.colors.textPrimary,
  backgroundColor: theme.colors.neutralLight,
  labelStyle: theme.textStyle.headingSmall.copyWith(
    color: theme.colors.textPrimary,
  ),
  secondaryLabelStyle: theme.textStyle.headingSmall.copyWith(
    color: theme.colors.neutralLight,
  ),
  secondarySelectedColor: theme.colors.textPrimary,
  // TODO: DS: Token Disabled Color
  disabledColor: const Color(0xFF9E9E9E),
  shape: SmoothRectangleBorder(
    borderRadius: SmoothBorderRadius(
      cornerSmoothing: 1,
      cornerRadius: theme.borderradius.medium,
    ),
  ),
);

final theme = ThemeData();
