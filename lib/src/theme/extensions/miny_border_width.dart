import 'dart:ui';

import 'package:flutter/material.dart';

import '../../tokens/border_width_tokens.dart';

class MinyBorderWidth extends ThemeExtension<MinyBorderWidth> {
  const MinyBorderWidth({
    this.none = BorderWidthTokens.none,
    this.small = BorderWidthTokens.small,
    this.medium = BorderWidthTokens.medium,
    this.large = BorderWidthTokens.large,
  });
  final double none;
  final double small;
  final double medium;
  final double large;

  @override
  MinyBorderWidth copyWith({
    double? none,
    double? small,
    double? medium,
    double? large,
  }) =>
      MinyBorderWidth(
        none: none ?? this.none,
        small: small ?? this.small,
        medium: medium ?? this.medium,
        large: large ?? this.large,
      );

  @override
  MinyBorderWidth lerp(ThemeExtension<MinyBorderWidth>? other, double t) {
    if (other is! MinyBorderWidth) return this;
    return MinyBorderWidth(
      none: lerpDouble(none, other.none, t) ?? none,
      small: lerpDouble(small, other.small, t) ?? small,
      medium: lerpDouble(medium, other.medium, t) ?? medium,
      large: lerpDouble(large, other.large, t) ?? large,
    );
  }
}
