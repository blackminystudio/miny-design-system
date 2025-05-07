import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'generators/border_radius_generator.dart';
import 'generators/border_width_generator.dart';
import 'generators/colors_generator.dart';
import 'generators/elevation_generator.dart';
import 'generators/opacity_generator.dart';
import 'generators/sizing_generator.dart';
import 'generators/spacing_generator.dart';
import 'generators/typography_generator.dart';

Future<void> main() async {
  final inputFile = File('tokens/tokens.json');
  if (!inputFile.existsSync()) {
    log('[ERROR] tokens.json not found');
    exit(1);
  }

  final rawJson = inputFile.readAsStringSync();
  final Map<String, dynamic> json = jsonDecode(rawJson);

  final tokens = json['global'] as Map<String, dynamic>;

  // Token Generators

  await generateColors(tokens['color']);
  await generateSpacing(tokens['spacing']);
  await generateSizing(tokens['sizing']);
  await generateTypography(tokens['typography']);
  await generateOpacity(tokens['opacity']);
  await generateElevation(tokens['elevation']);
  await generateBorderRadius(tokens['borderRadius']);
  await generateBorderWidth(tokens['borderWidth']);
  log('✅ All tokens generated successfully!');

  // Extentions Generators

  await generateColorsExtension(tokens['color']);
  await generateSpacingExtension(tokens['spacing']);
  await generateSizingExtension(tokens['sizing']);
  await generateTypographyExtension(tokens['typography']);
  await generateOpacityExtension(tokens['opacity']);
  await generateElevationExtension(tokens['elevation']);
  await generateBorderRadiusExtension(tokens['borderRadius']);
  await generateBorderWidthExtension(tokens['borderWidth']);
  log('✅ All extensions generated successfully!');
}
