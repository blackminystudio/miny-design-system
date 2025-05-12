import 'package:flutter/material.dart';

import '../../packages/figma_squircle/figma_squircle.dart';

class MinyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted, onChanged;
  final String? hintText;
  final TextStyle? style;
  const MinyTextField({
    super.key,
    this.hintText,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          side: BorderSide(
            width: 2,
            color: Color(0xffE7E5E7),
          ),
          borderRadius: SmoothBorderRadius(
            cornerRadius: 10,
            cornerSmoothing: 1,
          ),
        ),
      ),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFB5B3B2),
          ),
          border: InputBorder.none,
        ),
        style: style ??
            TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF2C3441),
            ),
      ),
    );
  }
}
