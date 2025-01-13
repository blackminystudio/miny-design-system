import '../figma_squircle.dart';
import 'package:flutter/widgets.dart';

class ClipSmoothRect extends StatelessWidget {
  const ClipSmoothRect({
    super.key,
    required this.child,
    this.radius = SmoothBorderRadius.zero,
    this.clipBehavior = Clip.antiAlias,
  });

  final SmoothBorderRadius radius;
  final Clip clipBehavior;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath.shape(
      clipBehavior: clipBehavior,
      shape: SmoothRectangleBorder(
        borderRadius: radius,
      ),
      child: child,
    );
  }
}
