import 'dart:developer';
import 'dart:io';

Future<void> generateSizing(Map<String, dynamic> sizingTokens) async {
  final buffer = StringBuffer()
    ..writeln('// GENERATED FILE - DO NOT MODIFY BY HAND\n')
    ..writeln('class SizingTokens {');

  sizingTokens.forEach((key, value) {
    final map = value as Map<String, dynamic>;
    final val = map['value'].toString();
    buffer.writeln('  static const double $key = $val;');
  });

  buffer
    ..writeln('}')
    ..writeln();

  final file = File('lib/src/tokens/sizing_tokens.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated sizing_tokens.dart');
}

Future<void> generateSizingExtension(
  Map<String, dynamic> sizingTokens,
) async {
  final buffer = StringBuffer()
    ..writeln('// GENERATED FILE - DO NOT MODIFY BY HAND')
    ..writeln("import 'package:flutter/material.dart';")
    ..writeln("import 'package:flutter_screenutil/flutter_screenutil.dart';")
    ..writeln("import '../../tokens/sizing_tokens.dart';\n")
    ..writeln('class MinySizing extends ThemeExtension<MinySizing> {')
    ..writeln('  final SizingDimensions width;')
    ..writeln('  final SizingDimensions height;\n')
    ..writeln('  MinySizing()')
    ..writeln('      : width = SizingDimensions(scale: (value) => value.w),')
    ..writeln('        height = SizingDimensions(scale: (value) => value.h);\n')
    ..writeln('  @override')
    ..writeln('  MinySizing copyWith({')
    ..writeln('    SizingDimensions? width,')
    ..writeln('    SizingDimensions? height,')
    ..writeln('  }) => MinySizing();\n')
    ..writeln('  @override')
    ..writeln(
        '  MinySizing lerp(ThemeExtension<MinySizing>? other, double t) {')
    ..writeln('    if (other is! MinySizing) return this;')
    ..writeln('    return MinySizing();')
    ..writeln('  }\n')
    ..writeln('}\n')
    ..writeln('class SizingDimensions {')
    ..writeln('  final double Function(double) scale;')
    ..writeln('  SizingDimensions({required this.scale});');

  for (final key in sizingTokens.keys) {
    buffer.writeln('  double get $key => scale(SizingTokens.$key);');
  }

  buffer.writeln('}');

  final file = File('lib/src/theme/extensions/miny_sizing.dart');
  await file.writeAsString(buffer.toString());

  log('✅ Generated miny_sizing.dart');
}
