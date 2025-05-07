import 'package:flutter/material.dart';
import 'package:miny_design_system/miny_design_system.dart';

class MinyContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double? borderRadius;
  final BorderSide? borderSide;
  final EdgeInsetsGeometry? padding;
  final bool hasCornerSmoothness;
  const MinyContainer({
    super.key,
    this.padding,
    this.borderSide,
    this.borderRadius,
    required this.child,
    this.backgroundColor,
    this.hasCornerSmoothness = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: ShapeDecoration(
        color: backgroundColor ?? theme.colors.neutralLightBackground,
        shape: SmoothRectangleBorder(
          side: borderSide ?? BorderSide.none,
          borderRadius: SmoothBorderRadius(
            cornerRadius: borderRadius ?? theme.borderradius.small,
            cornerSmoothing: hasCornerSmoothness ? 1 : 0,
          ),
        ),
      ),
      padding: padding ?? EdgeInsets.all(theme.sizing.height.s3),
      child: child,
    );
  }
}
