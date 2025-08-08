import 'package:flutter/material.dart';

import 'extensions/miny_border_radius.dart';
import 'extensions/miny_border_width.dart';
import 'extensions/miny_colors.dart';
import 'extensions/miny_elevation.dart';
import 'extensions/miny_opacity.dart';
import 'extensions/miny_sizing.dart';
import 'extensions/miny_spacing.dart';
import 'extensions/miny_typography.dart';
import 'src/themedata.dart';

export 'miny_icons.dart';

// THEME EXTENTIONS

final themeExtentions = <ThemeExtension<dynamic>>[
  // These are used with non-const as they are providing dynamic sizes
  // accroding to the screen sizes
  ...[
    MinySizing(),
    MinySpacing(),
    MinyTypography(),
  ],
  // These are fix sizes accroding to the design system
  ...[
    const MinyColors(),
    const MinyOpacity(),
    const MinyElevation(),
    const MinyBorderWidth(),
    const MinyBorderRadius(),
  ]
];

class MinyTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: TextTheme(
        // Display Styles
        displayLarge: MinyTypography().headingXxlarge,
        displayMedium: MinyTypography().headingXlarge,
        displaySmall: MinyTypography().headingLarge,

        // Headline Styles
        headlineLarge: MinyTypography().headingMedium,
        headlineMedium: MinyTypography().headingSmall,
        headlineSmall: MinyTypography().headingXsmall,

        // Title Styles
        titleLarge: MinyTypography().headingXxsmall,
        titleMedium: MinyTypography().bodyXxlarge,
        titleSmall: MinyTypography().bodyXlarge,

        // Body Styles
        bodyLarge: MinyTypography().bodyLarge,
        bodyMedium: MinyTypography().bodyMedium,
        bodySmall: MinyTypography().bodySmall,

        // Label Styles
        labelLarge: MinyTypography().bodyXsmall,
        labelMedium: MinyTypography().bodyXxsmall,
        labelSmall: MinyTypography().bodyXxsmall,
      ),
      chipTheme: chipThemeData,
      elevatedButtonTheme: elevatedButtonThemeData,
      progressIndicatorTheme: progressIndicatorThemeData,
      extensions: themeExtentions,
      inputDecorationTheme: inputDecoration,
      tabBarTheme: TabBarThemeData(indicatorColor: Colors.white),
    );
  }
}

extension ThemeExtensions on ThemeData {
  MinyBorderRadius get borderradius =>
      extension<MinyBorderRadius>() ?? const MinyBorderRadius();
  MinyBorderWidth get borderwidth =>
      extension<MinyBorderWidth>() ?? const MinyBorderWidth();
  // These are fix sizes accroding to the design system
  MinyColors get colors => extension<MinyColors>() ?? const MinyColors();
  MinyElevation get elevation =>
      extension<MinyElevation>() ?? const MinyElevation();
  MinyOpacity get opacity => extension<MinyOpacity>() ?? const MinyOpacity();
  // These are used with non-const as they are providing dynamic sizes
  // accroding to the screen sizes
  MinySizing get sizing => extension<MinySizing>() ?? MinySizing();
  MinySpacing get spacing => extension<MinySpacing>() ?? MinySpacing();
  MinyTypography get textStyle =>
      extension<MinyTypography>() ?? MinyTypography();
}
