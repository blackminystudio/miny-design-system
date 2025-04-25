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

Future<void> generateColorsExtension(Map<String, dynamic> colorTokens) async {
  try {
    final buffer = StringBuffer();
    buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
    buffer.writeln("import 'package:flutter/material.dart';");
    buffer.writeln("import '../../tokens/color_tokens.dart';\n");

    buffer.writeln("class MinyColors extends ThemeExtension<MinyColors> {");

    final flatTokens = <String, String>{};

    void extract(Map<String, dynamic> obj, String path) {
      obj.forEach((key, value) {
        final formattedKey = path.isEmpty
            ? key
            : '$path${key[0].toUpperCase()}${key.substring(1)}';
        if (value is Map<String, dynamic> &&
            value.containsKey('value') &&
            value['type'] == 'color') {
          final isGradient =
              value['value'].toString().startsWith('linear-gradient');
          flatTokens[formattedKey] = isGradient ? 'LinearGradient' : 'Color';
        } else if (value is Map<String, dynamic>) {
          extract(value, formattedKey);
        }
      });
    }

    extract(colorTokens, '');

    // Add fields
    for (final entry in flatTokens.entries) {
      buffer.writeln("  final ${entry.value} ${entry.key};");
    }

    // Constructor
    buffer.writeln("\n  const MinyColors({");
    for (final key in flatTokens.keys) {
      buffer.writeln("    this.$key = ColorTokens.$key,");
    }
    buffer.writeln("  });\n");

    // copyWith
    buffer.writeln("  @override");
    buffer.writeln("  MinyColors copyWith({");
    for (final entry in flatTokens.entries) {
      buffer.writeln("    ${entry.value}? ${entry.key},");
    }
    buffer.writeln("  }) => MinyColors(");
    for (final key in flatTokens.keys) {
      buffer.writeln("    $key: $key ?? this.$key,");
    }
    buffer.writeln("  );\n");

    // lerp
    buffer.writeln("  @override");
    buffer.writeln(
        "  MinyColors lerp(ThemeExtension<MinyColors>? other, double t) {");
    buffer.writeln("    if (other is! MinyColors) return this;");
    buffer.writeln("    return MinyColors(");
    for (final entry in flatTokens.entries) {
      if (entry.value == 'Color') {
        buffer.writeln(
            "      ${entry.key}: Color.lerp(${entry.key}, other.${entry.key}, t) ?? ${entry.key},");
      } else {
        buffer
            .writeln("      ${entry.key}: ${entry.key}, // Gradient - no lerp");
      }
    }
    buffer.writeln("    );");
    buffer.writeln("  }\n}");

    final file = File('lib/src/theme/extensions/miny_colors.dart');
    await file.writeAsString(buffer.toString());
    print('✅ Generated miny_colors.dart extension');
  } catch (e) {
    print('ERROR: $e');
  }
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
