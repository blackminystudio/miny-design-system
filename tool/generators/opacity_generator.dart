import 'dart:developer';
import 'dart:io';

Future<void> generateOpacity(Map<String, dynamic> opacityTokens) async {
  final buffer = StringBuffer()
    ..writeln('// GENERATED FILE - DO NOT MODIFY BY HAND\n')
    ..writeln('class OpacityTokens {');

  for (final entry in opacityTokens.entries) {
    final key = entry.key;
    final map = entry.value as Map<String, dynamic>;
    final val = map['value'].toString();
    buffer.writeln('  static const double $key = $val;');
  }

  buffer
    ..writeln('}')
    ..writeln();

  final file = File('lib/src/tokens/opacity_tokens.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated opacity_tokens.dart');
}

Future<void> generateOpacityExtension(
  Map<String, dynamic> opacityTokens,
) async {
  final buffer = StringBuffer()
    ..writeln('// GENERATED FILE - DO NOT MODIFY BY HAND')
    ..writeln("import 'dart:ui';")
    ..writeln("import 'package:flutter/material.dart';")
    ..writeln("import '../../tokens/opacity_tokens.dart';\n")
    ..writeln('class MinyOpacity extends ThemeExtension<MinyOpacity> {');

  // Fields
  for (final key in opacityTokens.keys) {
    buffer.writeln('  final double $key;');
  }

  // Constructor
  buffer.writeln('\n  const MinyOpacity({');
  for (final key in opacityTokens.keys) {
    buffer.writeln('    this.$key = OpacityTokens.$key,');
  }
  buffer
    ..writeln('  });')
    ..writeln('\n  @override')
    ..writeln('  MinyOpacity copyWith({');
  for (final key in opacityTokens.keys) {
    buffer.writeln('    double? $key,');
  }
  buffer.writeln('  }) => MinyOpacity(');
  for (final key in opacityTokens.keys) {
    buffer.writeln('    $key: $key ?? this.$key,');
  }
  buffer
    ..writeln('  );')
    ..writeln('\n  @override')
    ..writeln(
        '  MinyOpacity lerp(ThemeExtension<MinyOpacity>? other, double t) {')
    ..writeln('    if (other is! MinyOpacity) return this;')
    ..writeln('    return MinyOpacity(');
  for (final key in opacityTokens.keys) {
    buffer.writeln('      $key: lerpDouble($key, other.$key, t) ?? $key,');
  }
  buffer
    ..writeln('    );')
    ..writeln('  }')
    ..writeln('}');

  final file = File('lib/src/theme/extensions/miny_opacity.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated miny_opacity.dart');
}
