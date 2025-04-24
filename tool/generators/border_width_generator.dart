import 'dart:io';

Future<void> generateBorderWidth(Map<String, dynamic> widthTokens) async {
  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln('');
  buffer.writeln('class BorderWidthTokens {');

  widthTokens.forEach((key, value) {
    final val = value['value'].toString();
    buffer.writeln('  static const double $key = $val;');
  });

  buffer.writeln('}');

  final file = File('lib/src/tokens/border_width_tokens.dart');
  await file.writeAsString(buffer.toString());

  print('✅ Generated border_width_tokens.dart');
}
