import 'package:flutter/material.dart';

import 'smooth_rectangle_border.dart';

class SmoothInputBorder extends InputBorder {
  final SmoothRectangleBorder border;

  SmoothInputBorder({
    required this.border,
  }) : super(borderSide: border.side);

  @override
  bool get isOutline => true;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(border.side.width);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return border.getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return border.getInnerPath(rect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    border.paint(canvas, rect, textDirection: textDirection);
  }

  @override
  SmoothInputBorder copyWith({BorderSide? borderSide}) {
    return SmoothInputBorder(
      border: border.copyWith(side: borderSide ?? border.side),
    );
  }

  @override
  ShapeBorder scale(double t) {
    return SmoothInputBorder(border: border.scale(t) as SmoothRectangleBorder);
  }
}
