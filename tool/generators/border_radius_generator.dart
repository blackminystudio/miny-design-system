import 'dart:io';

Future<void> generateBorderRadius(Map<String, dynamic> radiusTokens) async {
  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln('');
  buffer.writeln('class BorderRadiusTokens {');

  radiusTokens.forEach((key, value) {
    final val = value['value'].toString();
    buffer.writeln('  static const double $key = $val;');
  });

  buffer.writeln('}');

  final file = File('lib/src/tokens/border_radius_tokens.dart');
  await file.writeAsString(buffer.toString());

  print('✅ Generated border_radius_tokens.dart');
}

Future<void> generateBorderRadiusExtension(
    Map<String, dynamic> radiusTokens) async {
  final buffer = StringBuffer();

  buffer.writeln("import 'dart:ui';");
  buffer.writeln("import 'package:flutter/material.dart';");
  buffer.writeln("import '../../tokens/border_radius_tokens.dart';");
  buffer.writeln("");
  buffer.writeln(
      "class MinyBorderRadius extends ThemeExtension<MinyBorderRadius> {");

  // Declare fields
  for (final key in radiusTokens.keys) {
    buffer.writeln("  final double $key;");
  }

  buffer.writeln("");
  buffer.writeln("  const MinyBorderRadius({");
  for (final key in radiusTokens.keys) {
    buffer.writeln("    this.$key = BorderRadiusTokens.$key,");
  }
  buffer.writeln("  });");

  // CopyWith
  buffer.writeln("");
  buffer.writeln("  @override");
  buffer.writeln("  MinyBorderRadius copyWith({");
  for (final key in radiusTokens.keys) {
    buffer.writeln("    double? $key,");
  }
  buffer.writeln("  }) =>");
  buffer.writeln("      MinyBorderRadius(");
  for (final key in radiusTokens.keys) {
    buffer.writeln("        $key: $key ?? this.$key,");
  }
  buffer.writeln("      );");

  // Optional: full() method
  buffer.writeln("");
  buffer.writeln("  double full(double width) => 0.5 * width;");

  // Lerp
  buffer.writeln("");
  buffer.writeln("  @override");
  buffer.writeln(
      "  MinyBorderRadius lerp(ThemeExtension<MinyBorderRadius>? other, double t) {");
  buffer.writeln("    if (other is! MinyBorderRadius) return this;");
  buffer.writeln("    return MinyBorderRadius(");
  for (final key in radiusTokens.keys) {
    buffer.writeln("      $key: lerpDouble($key, other.$key, t) ?? $key,");
  }
  buffer.writeln("    );");
  buffer.writeln("  }");

  buffer.writeln("}");

  final file = File('lib/src/theme/extensions/miny_border_radius.dart');
  await file.writeAsString(buffer.toString());

  print('✅ Generated miny_border_radius.dart');
}
