import 'package:flutter/material.dart';

import '../../miny_design_system.dart';
import '../../utilities/constants.dart';

/// A custom button for Miny Design System.
class MinyButton extends StatelessWidget {
  const MinyButton({
    required this.label,
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.iconPath,
    this.enableIcon = false,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enableIcon;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: const ButtonStyle().copyWith(
        backgroundColor: isLoading
            // TODO: DS Add into token
            ? WidgetStateProperty.all(
                const Color(0xff757376),
              )
            : null,
      ),
      child: isLoading
          ? SizedBox(
              height: theme.sizing.height.s8,
              width: theme.sizing.height.s8,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                strokeCap: StrokeCap.round,
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colors.neutralLight,
                ),
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (enableIcon) ...[
                  Image(
                    height: theme.sizing.height.s6,
                    width: theme.sizing.height.s6,
                    image: AssetImage(iconPath ?? Constants.googleIconPath),
                  ),
                  SizedBox(width: theme.spacing.width.s12),
                ],
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
