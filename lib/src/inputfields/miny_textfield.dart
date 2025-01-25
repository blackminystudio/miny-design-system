import 'package:flutter/material.dart';
import 'package:miny_design_system/packages/figma_squircle/figma_squircle.dart';

class MinyTextField extends StatelessWidget {
  final String? hintText;
  const MinyTextField({
    super.key,
    this.hintText,
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
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF2C3441),
        ),
      ),
    );
  }
}
