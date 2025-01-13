import 'package:flutter/material.dart';

/// A custom button for Miny Design System.
class MinyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  const MinyButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle().copyWith(
        backgroundColor: WidgetStateProperty.all(
          isLoading ? Color(0xff757376) : Color(0xff1F1E24),
        ),
      ),
      child: isLoading
          ? SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                strokeCap: StrokeCap.round,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
    );
  }
}
