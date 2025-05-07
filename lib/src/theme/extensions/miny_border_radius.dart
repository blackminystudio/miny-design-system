import 'dart:ui';
import 'package:flutter/material.dart';
import '../../tokens/border_radius_tokens.dart';

class MinyBorderRadius extends ThemeExtension<MinyBorderRadius> {
  final double none;
  final double xxSmall;
  final double xSmall;
  final double small;
  final double normal;
  final double medium;
  final double large;
  final double xLarge;

  const MinyBorderRadius({
    this.none = BorderRadiusTokens.none,
    this.xxSmall = BorderRadiusTokens.xxSmall,
    this.xSmall = BorderRadiusTokens.xSmall,
    this.small = BorderRadiusTokens.small,
    this.normal = BorderRadiusTokens.normal,
    this.medium = BorderRadiusTokens.medium,
    this.large = BorderRadiusTokens.large,
    this.xLarge = BorderRadiusTokens.xLarge,
  });

  @override
  MinyBorderRadius copyWith({
    double? none,
    double? xxSmall,
    double? xSmall,
    double? small,
    double? normal,
    double? medium,
    double? large,
    double? xLarge,
  }) =>
      MinyBorderRadius(
        none: none ?? this.none,
        xxSmall: xxSmall ?? this.xxSmall,
        xSmall: xSmall ?? this.xSmall,
        small: small ?? this.small,
        normal: normal ?? this.normal,
        medium: medium ?? this.medium,
        large: large ?? this.large,
        xLarge: xLarge ?? this.xLarge,
      );

  double full(double width) => 0.5 * width;

  @override
  MinyBorderRadius lerp(ThemeExtension<MinyBorderRadius>? other, double t) {
    if (other is! MinyBorderRadius) return this;
    return MinyBorderRadius(
      none: lerpDouble(none, other.none, t) ?? none,
      xxSmall: lerpDouble(xxSmall, other.xxSmall, t) ?? xxSmall,
      xSmall: lerpDouble(xSmall, other.xSmall, t) ?? xSmall,
      small: lerpDouble(small, other.small, t) ?? small,
      normal: lerpDouble(normal, other.normal, t) ?? normal,
      medium: lerpDouble(medium, other.medium, t) ?? medium,
      large: lerpDouble(large, other.large, t) ?? large,
      xLarge: lerpDouble(xLarge, other.xLarge, t) ?? xLarge,
    );
  }
}
