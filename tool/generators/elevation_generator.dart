import 'dart:developer';
import 'dart:io';

Future<void> generateElevation(Map<String, dynamic> elevationTokens) async {
  final buffer = StringBuffer()
    ..writeln('// GENERATED FILE - DO NOT MODIFY BY HAND')
    ..writeln("import 'package:flutter/material.dart';")
    ..writeln()
    ..writeln('class ElevationTokens {');

  elevationTokens.forEach((key, value) {
    final shadows = value['value'];
    if (shadows is List && shadows.isNotEmpty) {
      final shadow = shadows.first;
      final color = parseShadowColor(shadow['color'] as String);
      final x = shadow['x'];
      final y = shadow['y'];
      final blur = shadow['blur'];
      final spread = shadow['spread'];
      buffer
        ..writeln('  static const BoxShadow $key = BoxShadow(')
        ..writeln('    color: $color,')
        ..writeln('    offset: Offset($x, $y),')
        ..writeln('    blurRadius: $blur,')
        ..writeln('    spreadRadius: $spread,')
        ..writeln('  );');
    }
  });

  buffer.writeln('}');

  final file = File('lib/src/tokens/elevation_tokens.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated elevation_tokens.dart');
}

Future<void> generateElevationExtension(
    Map<String, dynamic> elevationTokens) async {
  final buffer = StringBuffer()
    ..writeln("import 'package:flutter/material.dart';")
    ..writeln("import '../../tokens/elevation_tokens.dart';")
    ..writeln()
    ..writeln('class MinyElevation extends ThemeExtension<MinyElevation> {');

  // Fields
  for (final key in elevationTokens.keys) {
    buffer.writeln('  final BoxShadow $key;');
  }

  buffer
    ..writeln()
    ..writeln('  const MinyElevation({');
  for (final key in elevationTokens.keys) {
    buffer.writeln('    this.$key = ElevationTokens.$key,');
  }
  buffer
    ..writeln('  });')

    // copyWith
    ..writeln()
    ..writeln('  @override')
    ..writeln('  MinyElevation copyWith({');
  for (final key in elevationTokens.keys) {
    buffer.writeln('    BoxShadow? $key,');
  }
  buffer
    ..writeln('  }) =>')
    ..writeln('      MinyElevation(');
  for (final key in elevationTokens.keys) {
    buffer.writeln('        $key: $key ?? this.$key,');
  }
  buffer
    ..writeln('      );')

    // lerp
    ..writeln()
    ..writeln('  @override')
    ..writeln(
        '  MinyElevation lerp(ThemeExtension<MinyElevation>? other, double t){')
    ..writeln('    if (other is! MinyElevation) return this;')
    ..writeln('    return MinyElevation(');
  for (final key in elevationTokens.keys) {
    buffer.writeln('      $key: BoxShadow.lerp($key, other.$key, t) ?? $key,');
  }
  buffer
    ..writeln('    );')
    ..writeln('  }')
    ..writeln('}');

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
