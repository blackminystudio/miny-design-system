import 'dart:io';

Future<void> generateBorderWidth(Map<String, dynamic> widthTokens) async {
  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln('');
  buffer.writeln('class BorderWidthTokens {');

  widthTokens.forEach((key, value) {
    final val = value['value'].toString();
    buffer.writeln('  static const double $key = $val;');
  });

  buffer.writeln('}');

  final file = File('lib/src/tokens/border_width_tokens.dart');
  await file.writeAsString(buffer.toString());

  print('✅ Generated border_width_tokens.dart');
}

Future<void> generateBorderWidthExtension(
    Map<String, dynamic> widthTokens) async {
  final buffer = StringBuffer();

  buffer.writeln("import 'dart:ui';");
  buffer.writeln("import 'package:flutter/material.dart';");
  buffer.writeln("import '../../tokens/border_width_tokens.dart';");
  buffer.writeln("");
  buffer.writeln(
      "class MinyBorderWidth extends ThemeExtension<MinyBorderWidth> {");

  // Fields
  for (final key in widthTokens.keys) {
    buffer.writeln("  final double $key;");
  }

  buffer.writeln("");
  buffer.writeln("  const MinyBorderWidth({");
  for (final key in widthTokens.keys) {
    buffer.writeln("    this.$key = BorderWidthTokens.$key,");
  }
  buffer.writeln("  });");

  // copyWith
  buffer.writeln("");
  buffer.writeln("  @override");
  buffer.writeln("  MinyBorderWidth copyWith({");
  for (final key in widthTokens.keys) {
    buffer.writeln("    double? $key,");
  }
  buffer.writeln("  }) =>");
  buffer.writeln("      MinyBorderWidth(");
  for (final key in widthTokens.keys) {
    buffer.writeln("        $key: $key ?? this.$key,");
  }
  buffer.writeln("      );");

  // lerp
  buffer.writeln("");
  buffer.writeln("  @override");
  buffer.writeln(
      "  MinyBorderWidth lerp(ThemeExtension<MinyBorderWidth>? other, double t) {");
  buffer.writeln("    if (other is! MinyBorderWidth) return this;");
  buffer.writeln("    return MinyBorderWidth(");
  for (final key in widthTokens.keys) {
    buffer.writeln("      $key: lerpDouble($key, other.$key, t) ?? $key,");
  }
  buffer.writeln("    );");
  buffer.writeln("  }");

  buffer.writeln("}");

  final file = File('lib/src/theme/extensions/miny_border_width.dart');
  await file.writeAsString(buffer.toString());

  print('✅ Generated miny_border_width.dart');
}
