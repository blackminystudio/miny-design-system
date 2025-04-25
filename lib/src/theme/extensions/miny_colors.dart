// GENERATED FILE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import '../../tokens/color_tokens.dart';

class MinyColors extends ThemeExtension<MinyColors> {
  final Color textPrimary;
  final Color textSecondary;
  final Color textSecondarylight;
  final Color textAccentBlueText;
  final Color textAccentPurpleText;
  final Color textAccentGreenText;
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
  final LinearGradient gradientDark;
  final LinearGradient gradientPurple;
  final LinearGradient gradientBlue;

  const MinyColors({
    this.textPrimary = ColorTokens.textPrimary,
    this.textSecondary = ColorTokens.textSecondary,
    this.textSecondarylight = ColorTokens.textSecondarylight,
    this.textAccentBlueText = ColorTokens.textAccentBlueText,
    this.textAccentPurpleText = ColorTokens.textAccentPurpleText,
    this.textAccentGreenText = ColorTokens.textAccentGreenText,
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
    this.gradientDark = ColorTokens.gradientDark,
    this.gradientPurple = ColorTokens.gradientPurple,
    this.gradientBlue = ColorTokens.gradientBlue,
  });

  @override
  MinyColors copyWith({
    Color? textPrimary,
    Color? textSecondary,
    Color? textSecondarylight,
    Color? textAccentBlueText,
    Color? textAccentPurpleText,
    Color? textAccentGreenText,
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
    LinearGradient? gradientDark,
    LinearGradient? gradientPurple,
    LinearGradient? gradientBlue,
  }) => MinyColors(
    textPrimary: textPrimary ?? this.textPrimary,
    textSecondary: textSecondary ?? this.textSecondary,
    textSecondarylight: textSecondarylight ?? this.textSecondarylight,
    textAccentBlueText: textAccentBlueText ?? this.textAccentBlueText,
    textAccentPurpleText: textAccentPurpleText ?? this.textAccentPurpleText,
    textAccentGreenText: textAccentGreenText ?? this.textAccentGreenText,
    neutralBackground: neutralBackground ?? this.neutralBackground,
    neutralBorder: neutralBorder ?? this.neutralBorder,
    neutralLight: neutralLight ?? this.neutralLight,
    neutralLightBackground: neutralLightBackground ?? this.neutralLightBackground,
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
    gradientDark: gradientDark ?? this.gradientDark,
    gradientPurple: gradientPurple ?? this.gradientPurple,
    gradientBlue: gradientBlue ?? this.gradientBlue,
  );

  @override
  MinyColors lerp(ThemeExtension<MinyColors>? other, double t) {
    if (other is! MinyColors) return this;
    return MinyColors(
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      textSecondarylight: Color.lerp(textSecondarylight, other.textSecondarylight, t) ?? textSecondarylight,
      textAccentBlueText: Color.lerp(textAccentBlueText, other.textAccentBlueText, t) ?? textAccentBlueText,
      textAccentPurpleText: Color.lerp(textAccentPurpleText, other.textAccentPurpleText, t) ?? textAccentPurpleText,
      textAccentGreenText: Color.lerp(textAccentGreenText, other.textAccentGreenText, t) ?? textAccentGreenText,
      neutralBackground: Color.lerp(neutralBackground, other.neutralBackground, t) ?? neutralBackground,
      neutralBorder: Color.lerp(neutralBorder, other.neutralBorder, t) ?? neutralBorder,
      neutralLight: Color.lerp(neutralLight, other.neutralLight, t) ?? neutralLight,
      neutralLightBackground: Color.lerp(neutralLightBackground, other.neutralLightBackground, t) ?? neutralLightBackground,
      accentPurple: Color.lerp(accentPurple, other.accentPurple, t) ?? accentPurple,
      accentPurpleAlpha: Color.lerp(accentPurpleAlpha, other.accentPurpleAlpha, t) ?? accentPurpleAlpha,
      accentBlue: Color.lerp(accentBlue, other.accentBlue, t) ?? accentBlue,
      accentBlueAlpha: Color.lerp(accentBlueAlpha, other.accentBlueAlpha, t) ?? accentBlueAlpha,
      accentRed: Color.lerp(accentRed, other.accentRed, t) ?? accentRed,
      accentRedAlpha: Color.lerp(accentRedAlpha, other.accentRedAlpha, t) ?? accentRedAlpha,
      accentYellow: Color.lerp(accentYellow, other.accentYellow, t) ?? accentYellow,
      accentYellowAlpha: Color.lerp(accentYellowAlpha, other.accentYellowAlpha, t) ?? accentYellowAlpha,
      accentGreen: Color.lerp(accentGreen, other.accentGreen, t) ?? accentGreen,
      accentGreenAlpha: Color.lerp(accentGreenAlpha, other.accentGreenAlpha, t) ?? accentGreenAlpha,
      gradientDark: gradientDark, // Gradient - no lerp
      gradientPurple: gradientPurple, // Gradient - no lerp
      gradientBlue: gradientBlue, // Gradient - no lerp
    );
  }
}
