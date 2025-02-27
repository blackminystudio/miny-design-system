import 'package:flutter/material.dart';
import '../tokens/color_tokens.dart';

class MinyColors extends ThemeExtension<MinyColors> {
  final Color textPrimary;
  final Color textSecondary;
  final Color textSecondarylight;
  final Color neutralBackground;
  final Color neutralBorder;
  final Color neutralLight;
  final Color neutralLightBackground;
  final Color accentPurple;
  final Color accentPurpleAlpha;
  final Color accentBlue;
  final Color accentBlueAlpha;
  final Color accentRed;
  final Color accentRedAlpha;
  final Color accentYellow;
  final Color accentYellowAlpha;
  final Color accentGreen;
  final Color accentGreenAlpha;
  final Color accentBlueText;
  final Color accentPurpleText;
  final Color accentGreenText;

  const MinyColors({
    this.textPrimary = ColorTokens.textPrimary,
    this.textSecondary = ColorTokens.textSecondary,
    this.textSecondarylight = ColorTokens.textSecondarylight,
    this.neutralBackground = ColorTokens.neutralBackground,
    this.neutralBorder = ColorTokens.neutralBorder,
    this.neutralLight = ColorTokens.neutralLight,
    this.neutralLightBackground = ColorTokens.neutralLightBackground,
    this.accentPurple = ColorTokens.accentPurple,
    this.accentPurpleAlpha = ColorTokens.accentPurpleAlpha,
    this.accentBlue = ColorTokens.accentBlue,
    this.accentBlueAlpha = ColorTokens.accentBlueAlpha,
    this.accentRed = ColorTokens.accentRed,
    this.accentRedAlpha = ColorTokens.accentRedAlpha,
    this.accentYellow = ColorTokens.accentYellow,
    this.accentYellowAlpha = ColorTokens.accentYellowAlpha,
    this.accentGreen = ColorTokens.accentGreen,
    this.accentGreenAlpha = ColorTokens.accentGreenAlpha,
    this.accentBlueText = ColorTokens.accentBlueText,
    this.accentPurpleText = ColorTokens.accentPurpleText,
    this.accentGreenText = ColorTokens.accentGreenText,
  });

  @override
  MinyColors copyWith({
    Color? textPrimary,
    Color? textSecondary,
    Color? textSecondarylight,
    Color? neutralBackground,
    Color? neutralBorder,
    Color? neutralLight,
    Color? neutralLightBackground,
    Color? accentPurple,
    Color? accentPurpleAlpha,
    Color? accentBlue,
    Color? accentBlueAlpha,
    Color? accentRed,
    Color? accentRedAlpha,
    Color? accentYellow,
    Color? accentYellowAlpha,
    Color? accentGreen,
    Color? accentGreenAlpha,
    Color? accentBlueText,
    Color? accentPurpleText,
    Color? accentGreenText,
  }) =>
      MinyColors(
        textPrimary: textPrimary ?? this.textPrimary,
        textSecondary: textSecondary ?? this.textSecondary,
        textSecondarylight: textSecondarylight ?? this.textSecondarylight,
        neutralBackground: neutralBackground ?? this.neutralBackground,
        neutralBorder: neutralBorder ?? this.neutralBorder,
        neutralLight: neutralLight ?? this.neutralLight,
        neutralLightBackground:
            neutralLightBackground ?? this.neutralLightBackground,
        accentPurple: accentPurple ?? this.accentPurple,
        accentPurpleAlpha: accentPurpleAlpha ?? this.accentPurpleAlpha,
        accentBlue: accentBlue ?? this.accentBlue,
        accentBlueAlpha: accentBlueAlpha ?? this.accentBlueAlpha,
        accentRed: accentRed ?? this.accentRed,
        accentRedAlpha: accentRedAlpha ?? this.accentRedAlpha,
        accentYellow: accentYellow ?? this.accentYellow,
        accentYellowAlpha: accentYellowAlpha ?? this.accentYellowAlpha,
        accentGreen: accentGreen ?? this.accentGreen,
        accentGreenAlpha: accentGreenAlpha ?? this.accentGreenAlpha,
        accentBlueText: accentBlueText ?? this.accentBlueText,
        accentPurpleText: accentPurpleText ?? this.accentPurpleText,
        accentGreenText: accentGreenText ?? this.accentGreenText,
      );

  @override
  ThemeExtension<MinyColors> lerp(ThemeExtension<MinyColors>? other, double t) {
    if (other is! MinyColors) return this;

    return MinyColors(
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textSecondarylight:
          Color.lerp(textSecondarylight, other.textSecondarylight, t)!,
      neutralBackground:
          Color.lerp(neutralBackground, other.neutralBackground, t)!,
      neutralBorder: Color.lerp(neutralBorder, other.neutralBorder, t)!,
      neutralLight: Color.lerp(neutralLight, other.neutralLight, t)!,
      neutralLightBackground:
          Color.lerp(neutralLightBackground, other.neutralLightBackground, t)!,
      accentPurple: Color.lerp(accentPurple, other.accentPurple, t)!,
      accentPurpleAlpha:
          Color.lerp(accentPurpleAlpha, other.accentPurpleAlpha, t)!,
      accentBlue: Color.lerp(accentBlue, other.accentBlue, t)!,
      accentBlueAlpha: Color.lerp(accentBlueAlpha, other.accentBlueAlpha, t)!,
      accentRed: Color.lerp(accentRed, other.accentRed, t)!,
      accentYellow: Color.lerp(accentYellow, other.accentYellow, t)!,
      accentYellowAlpha:
          Color.lerp(accentYellowAlpha, other.accentYellowAlpha, t)!,
      accentGreen: Color.lerp(accentGreen, other.accentGreen, t)!,
      accentGreenAlpha:
          Color.lerp(accentGreenAlpha, other.accentGreenAlpha, t)!,
      accentBlueText: Color.lerp(accentBlueText, other.accentBlueText, t)!,
      accentPurpleText:
          Color.lerp(accentPurpleText, other.accentPurpleText, t)!,
      accentGreenText: Color.lerp(accentGreenText, other.accentGreenText, t)!,
    );
  }
}
