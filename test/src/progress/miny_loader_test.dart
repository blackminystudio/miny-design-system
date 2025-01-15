import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miny_design_system/miny_design_system.dart';

void main() {
  group('MinyLoader Widget Test', () {
    testWidgets(
        'Should display CircularProgressIndicator with default size and color',
        (WidgetTester tester) async {
      // Arrange: Build the widget.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MinyLoader(),
          ),
        ),
      );

      // Act: Find the CirculaÞrProgressIndicator.
      final circularProgressIndicatorFinder =
          find.byType(CircularProgressIndicator);

      // Assert: Check that CircularProgressIndicator is present.
      expect(circularProgressIndicatorFinder, findsOneWidget);

      // Check default size.
      final SizedBox sizedBox = tester.widget(find.byType(SizedBox));
      expect(sizedBox.width, 24.0);
      expect(sizedBox.height, 24.0);

      // Check default color (assume default is Colors.blue from widget).
      final CircularProgressIndicator indicator =
          tester.widget(circularProgressIndicatorFinder);
      expect(
        (indicator.valueColor as AlwaysStoppedAnimation).value,
        equals(Colors.blue),
      );
    });

    testWidgets(
        'Should display CircularProgressIndicator with custom size and color',
        (WidgetTester tester) async {
      // Arrange: Custom size and color.
      const double customSize = 48.0;
      const Color customColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MinyLoader(size: customSize, color: customColor),
          ),
        ),
      );

      // Act: Find the CircularProgressIndicator.
      final circularProgressIndicatorFinder =
          find.byType(CircularProgressIndicator);

      // Assert: Check that CircularProgressIndicator is present.
      expect(circularProgressIndicatorFinder, findsOneWidget);

      // Check custom size.
      final SizedBox sizedBox = tester.widget(find.byType(SizedBox));
      expect(sizedBox.width, customSize);
      expect(sizedBox.height, customSize);

      // Check custom color.
      final CircularProgressIndicator indicator =
          tester.widget(circularProgressIndicatorFinder);
      expect(
        (indicator.valueColor as AlwaysStoppedAnimation).value,
        equals(customColor),
      );
    });
  });
}
