import 'package:flutter/material.dart';

import '../../../packages/figma_squircle/figma_squircle.dart';

final chipThemeData = ChipThemeData(
  padding: EdgeInsets.symmetric(
    vertical: 15,
    horizontal: 44,
  ),
  labelPadding: EdgeInsets.zero,
  selectedColor: const Color(0xFF2C3441),
  backgroundColor: const Color(0xFFFFFFFF),
  labelStyle: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF2C3441),
  ),
  secondaryLabelStyle: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: const Color(0xFFFFFFFF),
  ),
  showCheckmark: false,
  secondarySelectedColor: const Color(0xFF2C3441),
  disabledColor: const Color(0xFF9E9E9E),
  shape: SmoothRectangleBorder(
    borderRadius: SmoothBorderRadius(
      cornerRadius: 15,
      cornerSmoothing: 1,
    ),
  ),
);
