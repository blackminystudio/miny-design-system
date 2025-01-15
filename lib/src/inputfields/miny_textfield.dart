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
            color: Color(0xffE7E5E7),
            width: 2,
          ),
          borderRadius: SmoothBorderRadius(
            cornerRadius: 10,
            cornerSmoothing: 1,
          ),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}
