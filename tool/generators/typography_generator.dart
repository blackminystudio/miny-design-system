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

Future<void> generateTypographyExtension(
    Map<String, dynamic> typographyTokens) async {
  final buffer = StringBuffer();

  buffer.writeln('// GENERATED FILE - DO NOT MODIFY BY HAND');
  buffer.writeln("import 'package:flutter/material.dart';");
  buffer.writeln("import '../../tokens/typography_tokens.dart';\n");

  buffer
      .writeln('class MinyTypography extends ThemeExtension<MinyTypography> {');

  final keys = <String>[];

  typographyTokens.forEach((group, sizes) {
    if (sizes is Map<String, dynamic>) {
      for (final size in sizes.keys) {
        final name = '$group${toPascalCase(size)}';
        keys.add(name);
        buffer.writeln('  final TextStyle $name;');
      }
    }
  });

  buffer.writeln('\n  MinyTypography({');
  for (final key in keys) {
    buffer.writeln('    TextStyle? $key,');
  }
  buffer.writeln('  })  :');
  for (int i = 0; i < keys.length; i++) {
    final key = keys[i];
    final comma = i == keys.length - 1 ? ';' : ',';
    buffer.writeln('        $key = $key ?? TypographyTokens.$key$comma');
  }

  // copyWith
  buffer.writeln('\n  @override');
  buffer.writeln('  MinyTypography copyWith({');
  for (final key in keys) {
    buffer.writeln('    TextStyle? $key,');
  }
  buffer.writeln('  }) => MinyTypography(');
  for (final key in keys) {
    buffer.writeln('    $key: $key ?? this.$key,');
  }
  buffer.writeln('  );');

  // lerp
  buffer.writeln('\n  @override');
  buffer.writeln(
      '  MinyTypography lerp(ThemeExtension<MinyTypography>? other, double t) {');
  buffer.writeln('    if (other is! MinyTypography) return this;');
  buffer.writeln('    return MinyTypography(');
  for (final key in keys) {
    buffer.writeln('      $key: TextStyle.lerp($key, other.$key, t) ?? $key,');
  }
  buffer.writeln('    );');
  buffer.writeln('  }');

  buffer.writeln('}');

  final file = File('lib/src/theme/extensions/miny_typography.dart');
  await file.writeAsString(buffer.toString());
  print('✅ Generated miny_typography.dart');
}

String toPascalCase(String input) {
  return input[0].toUpperCase() + input.substring(1);
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
