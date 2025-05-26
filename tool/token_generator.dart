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
  final json = jsonDecode(rawJson) as Map<String, dynamic>;

  final tokens = json['global'] as Map<String, dynamic>;

  // Token Generators

  await generateColors(tokens['color'] as Map<String, dynamic>);
  await generateSpacing(tokens['spacing'] as Map<String, dynamic>);
  await generateSizing(tokens['sizing'] as Map<String, dynamic>);
  await generateTypography(tokens['typography'] as Map<String, dynamic>);
  await generateOpacity(tokens['opacity'] as Map<String, dynamic>);
  await generateElevation(tokens['elevation'] as Map<String, dynamic>);
  await generateBorderRadius(tokens['borderRadius'] as Map<String, dynamic>);
  await generateBorderWidth(tokens['borderWidth'] as Map<String, dynamic>);
  log('✅ All tokens generated successfully!');

  // Extentions Generators

  await generateColorsExtension(tokens['color'] as Map<String, dynamic>);
  await generateSpacingExtension(tokens['spacing'] as Map<String, dynamic>);
  await generateSizingExtension(tokens['sizing'] as Map<String, dynamic>);
  await generateTypographyExtension(
      tokens['typography'] as Map<String, dynamic>);
  await generateOpacityExtension(tokens['opacity'] as Map<String, dynamic>);
  await generateElevationExtension(tokens['elevation'] as Map<String, dynamic>);
  await generateBorderRadiusExtension(
      tokens['borderRadius'] as Map<String, dynamic>);
  await generateBorderWidthExtension(
      tokens['borderWidth'] as Map<String, dynamic>);
  log('✅ All extensions generated successfully!');
}
