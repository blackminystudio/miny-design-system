import 'dart:io';

Future<void> generateTypography(Map<String, dynamic> typographyTokens) async {
  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln("import 'package:flutter/material.dart';");
  buffer
      .writeln("import 'package:flutter_screenutil/flutter_screenutil.dart';");
  buffer.writeln('');
  buffer.writeln('class TypographyTokens {');

  void addStyles(String groupName, Map<String, dynamic> groupTokens) {
    groupTokens.forEach((key, token) {
      final value = token['value'];
      final fontFamily = value['fontFamily'];
      final fontSize = value['fontSize'];
      final lineHeight = value['lineHeight'];
      final weight = value['fontWeight'];

      final height = (double.parse(lineHeight.toString()) /
              double.parse(fontSize.toString()))
          .toStringAsFixed(2);
      final dartWeight = _convertWeight(weight);

      final name = '$groupName${_capitalize(key)}';
      buffer.writeln('  static TextStyle get $name => TextStyle(');
      buffer.writeln("    fontFamily: '$fontFamily',");
      buffer.writeln("    fontSize: $fontSize.sp,");
      buffer.writeln("    fontWeight: $dartWeight,");
      buffer.writeln("    height: $height,");
      buffer.writeln("  );");
    });
  }

  addStyles('body', typographyTokens['body']);
  addStyles('heading', typographyTokens['heading']);

  buffer.writeln('}');

  final file = File('lib/src/tokens/typography_tokens.dart');
  await file.writeAsString(buffer.toString());

  print('✅ Generated typography_tokens.dart');
}

String _capitalize(String input) => input[0].toUpperCase() + input.substring(1);

String _convertWeight(String value) {
  final map = {
    'Book': 'FontWeight.w400',
    'Medium': 'FontWeight.w500',
    'Bold': 'FontWeight.w700',
    'Black': 'FontWeight.w900',
    'Regular': 'FontWeight.w400',
    'Normal': 'FontWeight.normal',
  };
  return map[value] ?? 'FontWeight.w400';
}
