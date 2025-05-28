import 'dart:developer';
import 'dart:io';

Future<void> generateBorderWidth(Map<String, dynamic> widthTokens) async {
  final buffer = StringBuffer()
    ..writeln('// GENERATED FILE - DO NOT MODIFY BY HAND\n')
    ..writeln('class BorderWidthTokens {');

  for (final entry in widthTokens.entries) {
    final map = entry.value as Map<String, dynamic>;
    final val = map['value'].toString();
    buffer.writeln('  static const double ${entry.key} = $val;');
  }

  buffer
    ..writeln('}')
    ..writeln();

  final file = File('lib/src/tokens/border_width_tokens.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated border_width_tokens.dart');
}

Future<void> generateBorderWidthExtension(
  Map<String, dynamic> widthTokens,
) async {
  final buffer = StringBuffer()
    ..writeln('// GENERATED FILE - DO NOT MODIFY BY HAND')
    ..writeln("import 'dart:ui';")
    ..writeln("import 'package:flutter/material.dart';")
    ..writeln("import '../../tokens/border_width_tokens.dart';\n")
    ..writeln(
        'class MinyBorderWidth extends ThemeExtension<MinyBorderWidth> {');

  // Fields
  for (final key in widthTokens.keys) {
    buffer.writeln('  final double $key;');
  }

  // Constructor
  buffer.writeln('\n  const MinyBorderWidth({');
  for (final key in widthTokens.keys) {
    buffer.writeln('    this.$key = BorderWidthTokens.$key,');
  }
  buffer
    ..writeln('  });')
    ..writeln('\n  @override')
    ..writeln('  MinyBorderWidth copyWith({');
  for (final key in widthTokens.keys) {
    buffer.writeln('    double? $key,');
  }
  buffer.writeln('  }) => MinyBorderWidth(');
  for (final key in widthTokens.keys) {
    buffer.writeln('    $key: $key ?? this.$key,');
  }
  buffer
    ..writeln('  );')
    ..writeln('\n  @override')
    ..writeln('  MinyBorderWidth lerp(ThemeExtension<MinyBorderWidth>? '
        'other, double t) {')
    ..writeln('    if (other is! MinyBorderWidth) return this;')
    ..writeln('    return MinyBorderWidth(');
  for (final key in widthTokens.keys) {
    buffer.writeln('      $key: lerpDouble($key, other.$key, t) ?? $key,');
  }
  buffer
    ..writeln('    );')
    ..writeln('  }')
    ..writeln('}');

  final file = File('lib/src/theme/extensions/miny_border_width.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated miny_border_width.dart');
}
