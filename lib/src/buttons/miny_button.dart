import 'package:flutter/material.dart';
import 'package:miny_design_system/miny_design_system.dart';

/// A custom button for Miny Design System.
class MinyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final String? iconPath;

  const MinyButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle().copyWith(
        backgroundColor: WidgetStateProperty.all(
          isLoading ? Color(0xff757376) : theme.colors.neutralBackground,
        ),
      ),
      child: isLoading
          ? SizedBox(
              height: theme.sizing.height.s8,
              width: theme.sizing.height.s8,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                strokeCap: StrokeCap.round,
                valueColor:
                    AlwaysStoppedAnimation<Color>(theme.colors.neutralLight),
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  height: theme.sizing.height.s7,
                  width: theme.sizing.height.s7,
                  image: AssetImage(iconPath!),
                ),
                SizedBox(width: theme.spacing.width.s12),
                Text(
                  label,
                  style: theme.textStyle.bodyMedium.copyWith(
                    color: theme.colors.neutralLight,
                  ),
                ),
              ],
            ),
    );
  }
}
