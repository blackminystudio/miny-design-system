import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miny_design_system/miny_design_system.dart';

import '../../Utils/test/Utils/helper_methods.dart';

void main() {
  testWidgets(
      'Given an empty values '
      'When MinyLoader is rendered '
      'Then it should display a CircularProgressIndicator with default values ',
      (WidgetTester tester) async {
    await pumpMinyWidgets(
      tester,
      child: const MinyLoader(),
    );

    final sizedBox = tester.widget(find.byType(SizedBox)) as SizedBox;
    final loader = tester.widget<CircularProgressIndicator>(
      find.byType(CircularProgressIndicator),
    );
    expect(sizedBox.width, 24.0);
    expect(sizedBox.height, 24.0);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(
      (loader.valueColor as AlwaysStoppedAnimation).value,
      equals(Colors.blue),
    );
    expect(loader.strokeWidth, equals(3.0));
  });
  testWidgets(
      'Given a valueColor '
      'When MinyLoader is rendered '
      'Then it should display with the specified color',
      (WidgetTester tester) async {
    final customColor = theme.colors.accentRed;
    await pumpMinyWidgets(
      tester,
      child: MinyLoader(
        color: customColor,
      ),
    );
    // Act
    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);
    final indicator = tester.widget(circularProgressIndicatorFinder)
        as CircularProgressIndicator;
    // Assert
    expect(
      (indicator.valueColor as AlwaysStoppedAnimation).value,
      equals(customColor),
    );
  });
  testWidgets(
      'Given a size '
      'When MinyLoader is rendered '
      'Then it should display with the specified size',
      (WidgetTester tester) async {
    const customSize = 48.0;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MinyLoader(size: customSize),
        ),
      ),
    );
    final sizedBox = tester.widget(find.byType(SizedBox)) as SizedBox;
    expect(find.byType(SizedBox), findsOneWidget);
    expect(sizedBox.width, customSize);
    expect(sizedBox.height, customSize);
  });
}
