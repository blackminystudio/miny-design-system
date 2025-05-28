import 'dart:developer';
import 'dart:io';

Future<void> generateBorderRadius(Map<String, dynamic> radiusTokens) async {
  final buffer = StringBuffer()
    ..writeln('// GENERATED FILE - DO NOT MODIFY BY HAND\n')
    ..writeln('class BorderRadiusTokens {');

  for (final entry in radiusTokens.entries) {
    final map = entry.value as Map<String, dynamic>;
    final val = map['value'].toString();
    buffer.writeln('  static const double ${entry.key} = $val;');
  }

  buffer
    ..writeln('}')
    ..writeln();

  final file = File('lib/src/tokens/border_radius_tokens.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated border_radius_tokens.dart');
}

Future<void> generateBorderRadiusExtension(
  Map<String, dynamic> radiusTokens,
) async {
  final buffer = StringBuffer()
    ..writeln('// GENERATED FILE - DO NOT MODIFY BY HAND')
    ..writeln("import 'dart:ui';")
    ..writeln("import 'package:flutter/material.dart';")
    ..writeln("import '../../tokens/border_radius_tokens.dart';\n")
    ..writeln(
        'class MinyBorderRadius extends ThemeExtension<MinyBorderRadius> {');

  // Fields
  for (final key in radiusTokens.keys) {
    buffer.writeln('  final double $key;');
  }

  // Constructor
  buffer.writeln('\n  const MinyBorderRadius({');
  for (final key in radiusTokens.keys) {
    buffer.writeln('    this.$key = BorderRadiusTokens.$key,');
  }
  buffer
    ..writeln('  });')
    ..writeln('\n  @override')
    ..writeln('  MinyBorderRadius copyWith({');
  for (final key in radiusTokens.keys) {
    buffer.writeln('    double? $key,');
  }
  buffer.writeln('  }) => MinyBorderRadius(');
  for (final key in radiusTokens.keys) {
    buffer.writeln('    $key: $key ?? this.$key,');
  }
  buffer
    ..writeln('  );')
    ..writeln('\n  double full(double width) => 0.5 * width;')
    ..writeln('\n  @override')
    ..writeln('  MinyBorderRadius lerp(ThemeExtension<MinyBorderRadius>? '
        'other, double t) {')
    ..writeln('    if (other is! MinyBorderRadius) return this;')
    ..writeln('    return MinyBorderRadius(');
  for (final key in radiusTokens.keys) {
    buffer.writeln('      $key: lerpDouble($key, other.$key, t) ?? $key,');
  }
  buffer
    ..writeln('    );')
    ..writeln('  }')
    ..writeln('}');

  final file = File('lib/src/theme/extensions/miny_border_radius.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated miny_border_radius.dart');
}
