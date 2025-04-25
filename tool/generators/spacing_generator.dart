import 'dart:io';

Future<void> generateSpacing(Map<String, dynamic> spacingTokens) async {
  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln('');
  buffer.writeln('class SpacingTokens {');

  spacingTokens.forEach((key, value) {
    final val = value['value'].toString();
    buffer.writeln('  static const double $key = $val;');
  });

  buffer.writeln('}');

  final file = File('lib/src/tokens/spacing_tokens.dart');
  await file.writeAsString(buffer.toString());
  print('✅ Generated spacing_tokens.dart');
}

Future<void> generateSpacingExtension(
    Map<String, dynamic> spacingTokens) async {
  final buffer = StringBuffer();

  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln("import 'package:flutter/material.dart';");
  buffer
      .writeln("import 'package:flutter_screenutil/flutter_screenutil.dart';");
  buffer.writeln("import '../../tokens/spacing_tokens.dart';\n");

  buffer.writeln('class MinySpacing extends ThemeExtension<MinySpacing> {');
  buffer.writeln('  final SpacingDimensions width;');
  buffer.writeln('  final SpacingDimensions height;\n');

  buffer.writeln('  MinySpacing()');
  buffer
      .writeln('      : width = SpacingDimensions(scale: (value) => value.w),');
  buffer.writeln(
      '        height = SpacingDimensions(scale: (value) => value.h);\n');

  buffer.writeln('  @override');
  buffer.writeln('  MinySpacing copyWith({');
  buffer.writeln('    SpacingDimensions? width,');
  buffer.writeln('    SpacingDimensions? height,');
  buffer.writeln('  }) => MinySpacing();\n');

  buffer.writeln('  @override');
  buffer.writeln(
      '  MinySpacing lerp(ThemeExtension<MinySpacing>? other, double t) {');
  buffer.writeln('    if (other is! MinySpacing) return this;');
  buffer.writeln('    return MinySpacing();');
  buffer.writeln('  }\n');

  buffer.writeln('}\n');

  buffer.writeln('class SpacingDimensions {');
  buffer.writeln('  final double Function(double) scale;');
  buffer.writeln('  SpacingDimensions({required this.scale});');

  for (final key in spacingTokens.keys) {
    buffer.writeln('  double get $key => scale(SpacingTokens.$key);');
  }

  buffer.writeln('}');

  final file = File('lib/src/theme/extensions/miny_spacing.dart');
  await file.writeAsString(buffer.toString());
  print('✅ Generated miny_spacing.dart');
}
