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

  print('✅ Generated sizing_tokens.dart');
}
