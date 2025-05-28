import 'package:flutter/widgets.dart';

import '../figma_squircle.dart';

class ClipSmoothRect extends StatelessWidget {
  const ClipSmoothRect({
    required this.child,
    super.key,
    this.radius = SmoothBorderRadius.zero,
    this.clipBehavior = Clip.antiAlias,
  });

  final SmoothBorderRadius radius;
  final Clip clipBehavior;
  final Widget child;

  @override
  Widget build(BuildContext context) => ClipPath.shape(
        clipBehavior: clipBehavior,
        shape: SmoothRectangleBorder(
          borderRadius: radius,
        ),
        child: child,
      );
}
