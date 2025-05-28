import 'package:flutter/material.dart';

import 'smooth_rectangle_border.dart';

class SmoothInputBorder extends InputBorder {
  SmoothInputBorder({
    required this.border,
  }) : super(borderSide: border.side);
  final SmoothRectangleBorder border;

  @override
  bool get isOutline => true;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(border.side.width);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      border.getOuterPath(rect, textDirection: textDirection);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      border.getInnerPath(rect, textDirection: textDirection);

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    border.paint(canvas, rect, textDirection: textDirection);
  }

  @override
  SmoothInputBorder copyWith({BorderSide? borderSide}) => SmoothInputBorder(
        border: border.copyWith(side: borderSide ?? border.side),
      );

  @override
  ShapeBorder scale(double t) =>
      SmoothInputBorder(border: border.scale(t) as SmoothRectangleBorder);
}
