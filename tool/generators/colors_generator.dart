import 'dart:io';

String extractGradient(String value) {
  final stopRegex = RegExp(r'rgba?\((.*?)\)\s*\d+%');
  final matches = stopRegex.allMatches(value);
  final stops =
      matches.map((match) => match.group(1)).whereType<String>().toList();

  final colors = stops.map((stop) {
    final rgba = stop.split(',').map((e) => e.trim()).toList();
    final r = int.parse(rgba[0]);
    final g = int.parse(rgba[1]);
    final b = int.parse(rgba[2]);
    final a = rgba.length == 4 ? double.parse(rgba[3]) : 1.0;
    return 'Color.fromRGBO($r, $g, $b, ${a.toStringAsFixed(2)})';
  }).toList();

  return '''
LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      ${colors.join(',\n      ')}
    ],
  )''';
}

Future<void> generateColors(Map<String, dynamic> colorTokens) async {
  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln("import 'package:flutter/material.dart';");
  buffer.writeln('');
  buffer.writeln('class ColorTokens {');

  void extractColors(Map<String, dynamic> data, String path) {
    data.forEach((key, value) {
      final newPath = path.isEmpty ? key : '$path${toPascalCase(key)}';

      if (value is Map<String, dynamic> && value['type'] == 'color') {
        final rawValue = value['value'].toString();

        if (rawValue.startsWith('linear-gradient')) {
          final gradient = extractGradient(rawValue);
          buffer.writeln('  static const LinearGradient $newPath = $gradient;');
        } else {
          final hex = rawValue.replaceAll('#', '');
          final color = hex.length == 6
              ? '0xFF$hex'
              : '0x${hex.substring(6)}${hex.substring(0, 6)}';
          buffer.writeln('  static const Color $newPath = Color($color);');
        }
      } else if (value is Map<String, dynamic>) {
        extractColors(value, newPath);
      }
    });
  }

  extractColors(colorTokens, '');

  buffer.writeln('}');

  final file = File('lib/src/tokens/color_tokens.dart');
  await file.writeAsString(buffer.toString());

  print('✅ Generated color_tokens.dart (colors + gradients combined)');
}

String toFlatPascal(String input) {
  return input
      .split('_')
      .map((e) => e[0].toUpperCase() + e.substring(1))
      .join();
}

String toPascalCase(String input) {
  return input
      .split('_')
      .map((e) => e[0].toUpperCase() + e.substring(1))
      .join();
}
