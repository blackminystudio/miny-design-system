import 'package:flutter/material.dart';
import '../tokens/typography_tokens.dart';

class MinyTypography extends ThemeExtension<MinyTypography> {
  final TextStyle bodyXxsmall;
  final TextStyle bodyXsmall;
  final TextStyle bodySmall;
  final TextStyle bodyMedium;
  final TextStyle bodyLarge;
  final TextStyle bodyXlarge;
  final TextStyle bodyXxlarge;
  final TextStyle headingXxsmall;
  final TextStyle headingXsmall;
  final TextStyle headingSmall;
  final TextStyle headingMedium;
  final TextStyle headingLarge;
  final TextStyle headingXlarge;
  final TextStyle headingXxlarge;

  MinyTypography({
    TextStyle? bodyXxsmall,
    TextStyle? bodyXsmall,
    TextStyle? bodySmall,
    TextStyle? bodyMedium,
    TextStyle? bodyLarge,
    TextStyle? bodyXlarge,
    TextStyle? bodyXxlarge,
    TextStyle? headingXxsmall,
    TextStyle? headingXsmall,
    TextStyle? headingSmall,
    TextStyle? headingMedium,
    TextStyle? headingLarge,
    TextStyle? headingXlarge,
    TextStyle? headingXxlarge,
  })  : bodyXxsmall = bodyXxsmall ?? TypographyTokens.bodyXxsmall,
        bodyXsmall = bodyXsmall ?? TypographyTokens.bodyXsmall,
        bodySmall = bodySmall ?? TypographyTokens.bodySmall,
        bodyMedium = bodyMedium ?? TypographyTokens.bodyMedium,
        bodyLarge = bodyLarge ?? TypographyTokens.bodyLarge,
        bodyXlarge = bodyXlarge ?? TypographyTokens.bodyXlarge,
        bodyXxlarge = bodyXxlarge ?? TypographyTokens.bodyXxlarge,
        headingXxsmall = headingXxsmall ?? TypographyTokens.headingXxsmall,
        headingXsmall = headingXsmall ?? TypographyTokens.headingXsmall,
        headingSmall = headingSmall ?? TypographyTokens.headingSmall,
        headingMedium = headingMedium ?? TypographyTokens.headingMedium,
        headingLarge = headingLarge ?? TypographyTokens.headingLarge,
        headingXlarge = headingXlarge ?? TypographyTokens.headingXlarge,
        headingXxlarge = headingXxlarge ?? TypographyTokens.headingXxlarge;

  @override
  ThemeExtension<MinyTypography> copyWith({
    final TextStyle? bodyXxsmall,
    final TextStyle? bodyXsmall,
    final TextStyle? bodySmall,
    final TextStyle? bodyMedium,
    final TextStyle? bodyLarge,
    final TextStyle? bodyXlarge,
    final TextStyle? bodyXxlarge,
    final TextStyle? headingXxsmall,
    final TextStyle? headingXsmall,
    final TextStyle? headingSmall,
    final TextStyle? headingMedium,
    final TextStyle? headingLarge,
    final TextStyle? headingXlarge,
    final TextStyle? headingXxlarge,
  }) =>
      MinyTypography(
        bodyXxsmall: bodyXxsmall ?? this.bodyXxsmall,
        bodyXsmall: bodyXsmall ?? this.bodyXsmall,
        bodySmall: bodySmall ?? this.bodySmall,
        bodyMedium: bodyMedium ?? this.bodyMedium,
        bodyLarge: bodyLarge ?? this.bodyLarge,
        bodyXlarge: bodyXlarge ?? this.bodyXlarge,
        bodyXxlarge: bodyXxlarge ?? this.bodyXxlarge,
        headingXxsmall: headingXxsmall ?? this.headingXxsmall,
        headingXsmall: headingXsmall ?? this.headingXsmall,
        headingSmall: headingSmall ?? this.headingSmall,
        headingMedium: headingMedium ?? this.headingMedium,
        headingLarge: headingLarge ?? this.headingLarge,
        headingXlarge: headingXlarge ?? this.headingXlarge,
        headingXxlarge: headingXxlarge ?? this.headingXxlarge,
      );

  @override
  ThemeExtension<MinyTypography> lerp(
    final ThemeExtension<MinyTypography>? other,
    final double t,
  ) {
    if (other is! MinyTypography) {
      return this;
    }
    return MinyTypography(
      bodyXxsmall:
          TextStyle.lerp(bodyXxsmall, other.bodyXxsmall, t) ?? bodyXxsmall,
      bodyXsmall: TextStyle.lerp(bodyXsmall, other.bodyXsmall, t) ?? bodyXsmall,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t) ?? bodySmall,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t) ?? bodyMedium,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t) ?? bodyLarge,
      bodyXlarge: TextStyle.lerp(bodyXlarge, other.bodyXlarge, t) ?? bodyXlarge,
      bodyXxlarge:
          TextStyle.lerp(bodyXxlarge, other.bodyXxlarge, t) ?? bodyXxlarge,
      headingXxsmall: TextStyle.lerp(headingXxsmall, other.headingXxsmall, t) ??
          headingXxsmall,
      headingXsmall: TextStyle.lerp(headingXsmall, other.headingXsmall, t) ??
          headingXsmall,
      headingSmall:
          TextStyle.lerp(headingSmall, other.headingSmall, t) ?? headingSmall,
      headingMedium: TextStyle.lerp(headingMedium, other.headingMedium, t) ??
          headingMedium,
      headingLarge:
          TextStyle.lerp(headingLarge, other.headingLarge, t) ?? headingLarge,
      headingXlarge: TextStyle.lerp(headingXlarge, other.headingXlarge, t) ??
          headingXlarge,
      headingXxlarge: TextStyle.lerp(headingXxlarge, other.headingXxlarge, t) ??
          headingXxlarge,
    );
  }
}
