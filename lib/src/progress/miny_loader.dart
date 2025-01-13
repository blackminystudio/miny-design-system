import 'package:flutter/material.dart';

/// A customizable circular loader.
class MinyLoader extends StatelessWidget {
  final double size;
  final Color? color;

  const MinyLoader({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ??
              Theme.of(context).progressIndicatorTheme.color ??
              Colors.blue,
        ),
      ),
    );
  }
}
