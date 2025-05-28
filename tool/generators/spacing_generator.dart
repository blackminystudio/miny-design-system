import 'dart:developer';
import 'dart:io';

Future<void> generateSpacing(Map<String, dynamic> spacingTokens) async {
  final buffer = StringBuffer()
    ..writeln('// GENERATED FILE - DO NOT MODIFY BY HAND\n')
    ..writeln('class SpacingTokens {');

  spacingTokens.forEach((key, value) {
    final map = value as Map<String, dynamic>;
    final val = map['value'].toString();
    buffer.writeln('  static const double $key = $val;');
  });

  buffer
    ..writeln('}')
    ..writeln(); // Ensures a trailing newline
  final file = File('lib/src/tokens/spacing_tokens.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated spacing_tokens.dart');
}

Future<void> generateSpacingExtension(
  Map<String, dynamic> spacingTokens,
) async {
  final buffer = StringBuffer()
    ..writeln('// GENERATED FILE - DO NOT MODIFY BY HAND')
    ..writeln("import 'package:flutter/material.dart';")
    ..writeln("import 'package:flutter_screenutil/flutter_screenutil.dart';")
    ..writeln("import '../../tokens/spacing_tokens.dart';\n")
    ..writeln('class MinySpacing extends ThemeExtension<MinySpacing> {')
    ..writeln('  final SpacingDimensions width;')
    ..writeln('  final SpacingDimensions height;\n')
    ..writeln('  MinySpacing()')
    ..writeln('      : width = SpacingDimensions(scale: (value) => value.w),')
    ..writeln(
        '        height = SpacingDimensions(scale: (value) => value.h);\n')
    ..writeln('  @override')
    ..writeln('  MinySpacing copyWith({')
    ..writeln('    SpacingDimensions? width,')
    ..writeln('    SpacingDimensions? height,')
    ..writeln('  }) => MinySpacing();\n')
    ..writeln('  @override')
    ..writeln(
        '  MinySpacing lerp(ThemeExtension<MinySpacing>? other, double t) {')
    ..writeln('    if (other is! MinySpacing) return this;')
    ..writeln('    return MinySpacing();')
    ..writeln('  }\n')
    ..writeln('}\n')
    ..writeln('class SpacingDimensions {')
    ..writeln('  final double Function(double) scale;')
    ..writeln('  SpacingDimensions({required this.scale});');

  for (final key in spacingTokens.keys) {
    buffer.writeln('  double get $key => scale(SpacingTokens.$key);');
  }

  buffer.writeln('}');

  final file = File('lib/src/theme/extensions/miny_spacing.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated miny_spacing.dart');
}
