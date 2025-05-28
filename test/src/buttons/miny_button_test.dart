import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miny_design_system/miny_design_system.dart';
import 'package:miny_design_system/utilities/constants.dart';

import '../../Utils/helper_methods.dart';

void main() {
  group('isLoading true', () {
    testWidgets(
        'Given isLoading is true '
        'When MinyButton is rendered '
        'Then button should be null and ProgressIndicator should be shown ',
        (WidgetTester tester) async {
      await pumpMinyWidgets(
        tester,
        child: const MinyButton(
          label: testLabel,
          isLoading: true,
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final style = button.style;
      final backgroundColor = style?.backgroundColor?.resolve({});
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text(testLabel), findsNothing);
      expect(button.onPressed, isNull);
      expect(backgroundColor, equals(const Color(0xff757376)));
    });

    testWidgets(
        'Given isLoading is true and onPressed is provided '
        'When MinyButton is tapped '
        'Then the callback should not be executed',
        (WidgetTester tester) async {
      var isPressed = false;

      await pumpMinyWidgets(
        tester,
        child: MinyButton(
          label: testLabel,
          isLoading: true,
          onPressed: () {
            isPressed = true;
          },
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(isPressed, isFalse);
    });
  });

  group('isLoading false', () {
    testWidgets(
        'Given isLoading is false '
        'When MinyButton is tapped '
        'Then callback should be executed ', (WidgetTester tester) async {
      var isPressed = false;

      await pumpMinyWidgets(
        tester,
        child: MinyButton(
          label: testLabel,
          onPressed: () {
            isPressed = true;
          },
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(isPressed, isTrue);
    });

    group('enabledIcon true', () {
      testWidgets(
          'Given enableIcon is true, and isLoading is false '
          'When MinyButton is rendered '
          'Then it should display a default icon image, SizedBox, and label',
          (WidgetTester tester) async {
        await pumpMinyWidgets(
          tester,
          child: const MinyButton(
            label: testLabel,
            enableIcon: true,
          ),
        );

        final imageWidget = tester.widget<Image>(find.byType(Image));
        final assetImage = imageWidget.image as AssetImage;
        expect(assetImage.assetName, Constants.googleIconPath);
        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
        expect(find.text(testLabel), findsOneWidget);
      });

      testWidgets(
          'Given a custom iconPath, enableIcon is true, and isLoading is false '
          'When MinyButton is rendered '
          'Then it should display the custom icon image, SizedBox, and label',
          (WidgetTester tester) async {
        await pumpMinyWidgets(
          tester,
          child: const MinyButton(
            label: testLabel,
            iconPath: iconPath,
            enableIcon: true,
          ),
        );

        final imageWidget = tester.widget<Image>(find.byType(Image));
        final assetImage = imageWidget.image as AssetImage;
        expect(assetImage.assetName, iconPath);
        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
        expect(find.text(testLabel), findsOneWidget);
      });
    });

    testWidgets(
        'Given enableIcon is false, and isLoading is false '
        'When MinyButton is rendered '
        'Then it displays only the label', (WidgetTester tester) async {
      await pumpMinyWidgets(
        tester,
        child: const MinyButton(
          label: testLabel,
        ),
      );

      expect(find.byType(SizedBox), findsNothing);
      expect(find.byType(Image), findsNothing);
      expect(find.text(testLabel), findsOneWidget);
    });
  });
}
