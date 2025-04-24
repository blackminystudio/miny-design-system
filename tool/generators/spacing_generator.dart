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
