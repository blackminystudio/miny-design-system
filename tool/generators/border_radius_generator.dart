import 'dart:io';

Future<void> generateBorderRadius(Map<String, dynamic> radiusTokens) async {
  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln('');
  buffer.writeln('class BorderRadiusTokens {');

  radiusTokens.forEach((key, value) {
    final val = value['value'].toString();
    buffer.writeln('  static const double $key = $val;');
  });

  buffer.writeln('}');

  final file = File('lib/src/tokens/border_radius_tokens.dart');
  await file.writeAsString(buffer.toString());

  print('✅ Generated border_radius_tokens.dart');
}
