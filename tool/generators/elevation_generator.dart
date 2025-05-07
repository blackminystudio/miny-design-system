import 'dart:developer';
import 'dart:io';

Future<void> generateElevation(Map<String, dynamic> elevationTokens) async {
  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln("import 'package:flutter/material.dart';");
  buffer.writeln('');
  buffer.writeln('class ElevationTokens {');

  elevationTokens.forEach((key, value) {
    final shadows = value['value'];
    if (shadows is List && shadows.isNotEmpty) {
      final shadow = shadows.first;
      final color = parseShadowColor(shadow['color']);
      final x = shadow['x'];
      final y = shadow['y'];
      final blur = shadow['blur'];
      final spread = shadow['spread'];
      buffer.writeln('  static const BoxShadow $key = BoxShadow(');
      buffer.writeln('    color: $color,');
      buffer.writeln('    offset: Offset($x, $y),');
      buffer.writeln('    blurRadius: $blur,');
      buffer.writeln('    spreadRadius: $spread,');
      buffer.writeln('  );');
    }
  });

  buffer.writeln('}');

  final file = File('lib/src/tokens/elevation_tokens.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated elevation_tokens.dart');
}

Future<void> generateElevationExtension(
    Map<String, dynamic> elevationTokens) async {
  final buffer = StringBuffer();

  buffer.writeln("import 'package:flutter/material.dart';");
  buffer.writeln("import '../../tokens/elevation_tokens.dart';");
  buffer.writeln("");
  buffer.writeln("class MinyElevation extends ThemeExtension<MinyElevation> {");

  // Fields
  for (final key in elevationTokens.keys) {
    buffer.writeln("  final BoxShadow $key;");
  }

  buffer.writeln("");
  buffer.writeln("  const MinyElevation({");
  for (final key in elevationTokens.keys) {
    buffer.writeln("    this.$key = ElevationTokens.$key,");
  }
  buffer.writeln("  });");

  // copyWith
  buffer.writeln("");
  buffer.writeln("  @override");
  buffer.writeln("  MinyElevation copyWith({");
  for (final key in elevationTokens.keys) {
    buffer.writeln("    BoxShadow? $key,");
  }
  buffer.writeln("  }) =>");
  buffer.writeln("      MinyElevation(");
  for (final key in elevationTokens.keys) {
    buffer.writeln("        $key: $key ?? this.$key,");
  }
  buffer.writeln("      );");

  // lerp
  buffer.writeln("");
  buffer.writeln("  @override");
  buffer.writeln(
      "  MinyElevation lerp(ThemeExtension<MinyElevation>? other, double t) {");
  buffer.writeln("    if (other is! MinyElevation) return this;");
  buffer.writeln("    return MinyElevation(");
  for (final key in elevationTokens.keys) {
    buffer.writeln("      $key: BoxShadow.lerp($key, other.$key, t) ?? $key,");
  }
  buffer.writeln("    );");
  buffer.writeln("  }");

  buffer.writeln("}");

  final file = File('lib/src/theme/extensions/miny_elevation.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated miny_elevation.dart');
}

String parseShadowColor(String hex) {
  final cleaned = hex.replaceAll('#', '');
  if (cleaned.length == 8) {
    final a = cleaned.substring(6, 8);
    final rgb = cleaned.substring(0, 6);
    return 'Color(0x$a$rgb)';
  }
  return 'Color(0xFF$cleaned)';
}
