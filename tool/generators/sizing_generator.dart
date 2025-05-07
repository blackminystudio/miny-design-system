import 'dart:developer';
import 'dart:io';

Future<void> generateSizing(Map<String, dynamic> sizingTokens) async {
  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln('');
  buffer.writeln('class SizingTokens {');

  sizingTokens.forEach((key, value) {
    final val = value['value'].toString();
    buffer.writeln('  static const double $key = $val;');
  });

  buffer.writeln('}');

  final file = File('lib/src/tokens/sizing_tokens.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated sizing_tokens.dart');
}

Future<void> generateSizingExtension(Map<String, dynamic> sizingTokens) async {
  final buffer = StringBuffer();

  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln("import 'package:flutter/material.dart';");
  buffer
      .writeln("import 'package:flutter_screenutil/flutter_screenutil.dart';");
  buffer.writeln("import '../../tokens/sizing_tokens.dart';\n");

  buffer.writeln('class MinySizing extends ThemeExtension<MinySizing> {');
  buffer.writeln('  final SizingDimensions width;');
  buffer.writeln('  final SizingDimensions height;\n');

  buffer.writeln('  MinySizing()');
  buffer
      .writeln('      : width = SizingDimensions(scale: (value) => value.w),');
  buffer.writeln(
      '        height = SizingDimensions(scale: (value) => value.h);\n');

  buffer.writeln('  @override');
  buffer.writeln('  MinySizing copyWith({');
  buffer.writeln('    SizingDimensions? width,');
  buffer.writeln('    SizingDimensions? height,');
  buffer.writeln('  }) => MinySizing();\n');

  buffer.writeln('  @override');
  buffer.writeln(
      '  MinySizing lerp(ThemeExtension<MinySizing>? other, double t) {');
  buffer.writeln('    if (other is! MinySizing) return this;');
  buffer.writeln('    return MinySizing();');
  buffer.writeln('  }\n');

  buffer.writeln('}\n');

  buffer.writeln('class SizingDimensions {');
  buffer.writeln('  final double Function(double) scale;');
  buffer.writeln('  SizingDimensions({required this.scale});');

  for (final key in sizingTokens.keys) {
    buffer.writeln('  double get $key => scale(SizingTokens.$key);');
  }

  buffer.writeln('}');

  final file = File('lib/src/theme/extensions/miny_sizing.dart');
  await file.writeAsString(buffer.toString());
  log('✅ Generated miny_sizing.dart');
}
