import 'dart:io';

Future<void> generateOpacity(Map<String, dynamic> opacityTokens) async {
  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln('');
  buffer.writeln('class OpacityTokens {');

  opacityTokens.forEach((key, value) {
    final val = value['value'].toString();
    buffer.writeln('  static const double $key = $val;');
  });

  buffer.writeln('}');

  final file = File('lib/src/tokens/opacity_tokens.dart');
  await file.writeAsString(buffer.toString());

  print('✅ Generated opacity_tokens.dart');
}

Future<void> generateOpacityExtension(
    Map<String, dynamic> opacityTokens) async {
  final buffer = StringBuffer();

  buffer.writeln("import 'dart:ui';");
  buffer.writeln("import 'package:flutter/material.dart';");
  buffer.writeln("import '../../tokens/opacity_tokens.dart';");
  buffer.writeln("");
  buffer.writeln("class MinyOpacity extends ThemeExtension<MinyOpacity> {");

  // Fields
  for (final key in opacityTokens.keys) {
    buffer.writeln("  final double $key;");
  }

  buffer.writeln("");
  buffer.writeln("  const MinyOpacity({");
  for (final key in opacityTokens.keys) {
    buffer.writeln("    this.$key = OpacityTokens.$key,");
  }
  buffer.writeln("  });");

  // copyWith
  buffer.writeln("");
  buffer.writeln("  @override");
  buffer.writeln("  MinyOpacity copyWith({");
  for (final key in opacityTokens.keys) {
    buffer.writeln("    double? $key,");
  }
  buffer.writeln("  }) =>");
  buffer.writeln("      MinyOpacity(");
  for (final key in opacityTokens.keys) {
    buffer.writeln("        $key: $key ?? this.$key,");
  }
  buffer.writeln("      );");

  // lerp
  buffer.writeln("");
  buffer.writeln("  @override");
  buffer.writeln(
      "  MinyOpacity lerp(ThemeExtension<MinyOpacity>? other, double t) {");
  buffer.writeln("    if (other is! MinyOpacity) return this;");
  buffer.writeln("    return MinyOpacity(");
  for (final key in opacityTokens.keys) {
    buffer.writeln("      $key: lerpDouble($key, other.$key, t) ?? $key,");
  }
  buffer.writeln("    );");
  buffer.writeln("  }");

  buffer.writeln("}");

  final file = File('lib/src/theme/extensions/miny_opacity.dart');
  await file.writeAsString(buffer.toString());

  print('✅ Generated miny_opacity.dart');
}
