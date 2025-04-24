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

  print('✅ Generated elevation_tokens.dart');
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
