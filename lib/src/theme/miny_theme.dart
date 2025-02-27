import 'package:flutter/material.dart';
import 'package:miny_design_system/packages/figma_squircle/figma_squircle.dart';

class MinyTheme {
  static ThemeData get lightTheme => ThemeData(
        indicatorColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Color(0xff1F1E24)),
            // backgroundColor: WidgetStateProperty.resolveWith<Color>(
            //   (states) {
            //     if (states.contains(WidgetState.pressed)) {
            //       return Color(0xff757376);
            //     }
            //     return Color(0xff1F1E24);
            //   },
            // ),
            elevation: WidgetStateProperty.all(0),
            enableFeedback: true,
            minimumSize: WidgetStateProperty.all(
              Size(double.infinity, 55),
            ),
            overlayColor: WidgetStateProperty.all(Color(0xff7F7D80)),
            splashFactory: InkRipple.splashFactory,
            shape: WidgetStateProperty.all(
              SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 15,
                  cornerSmoothing: 1,
                ),
              ),
            ),
          ),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Color(0xffFFFEFF),
          circularTrackColor: Color(0xffB0AEB0),
          linearTrackColor: Colors.grey,
        ),
        chipTheme: ChipThemeData(
          padding: EdgeInsets.symmetric(horizontal: 44, vertical: 15),
          labelPadding: EdgeInsets.zero,
          backgroundColor: Colors.black87,
          selectedColor: Colors.black87,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          secondaryLabelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          showCheckmark: false,
          secondarySelectedColor: Color(0xff2C3441),
          disabledColor: Colors.grey,
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 15,
              cornerSmoothing: 1,
            ),
          ),
        ),
      );
}
