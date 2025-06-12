import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miny_design_system/miny_design_system.dart';

import '../../Utils/helper_methods.dart';

void main() {
  testWidgets(
      'Given a valid child and hasCornerSmoothness true '
      'When MinyContainer is rendered '
      'Then it should display the child widget', (WidgetTester tester) async {
    await pumpMinyWidgets(tester,
        child: (_) => const MinyContainer(
              child: icon,
            ));

    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as ShapeDecoration;
    final shape = decoration.shape as SmoothRectangleBorder;
    final borderRadius = shape.borderRadius;

    expect(find.byIcon(Icons.abc), findsOneWidget);
    expect(find.byType(MinyContainer), findsOneWidget);
    expect(borderRadius.topLeft.cornerSmoothing, equals(1));
    expect(borderRadius.topRight.cornerSmoothing, equals(1));
    expect(borderRadius.bottomLeft.cornerSmoothing, equals(1));
    expect(borderRadius.bottomRight.cornerSmoothing, equals(1));
    expect(decoration.color, equals(theme.colors.neutralLightBackground));
    expect(shape.side, equals(BorderSide.none));
    expect(
      borderRadius.bottomLeft.cornerRadius,
      equals(theme.borderradius.small),
    );
    expect(
      borderRadius.bottomRight.cornerRadius,
      equals(theme.borderradius.small),
    );
    expect(
      borderRadius.topLeft.cornerRadius,
      equals(theme.borderradius.small),
    );
    expect(
      borderRadius.topRight.cornerRadius,
      equals(theme.borderradius.small),
    );
    expect(
      container.padding,
      equals(EdgeInsets.all(theme.sizing.height.s3)),
    );
  });

  testWidgets(
      'Given hasCornerSmoothness false, '
      'When MinyContainer is rendered '
      'Then it should not display any cornerSmoothness',
      (WidgetTester tester) async {
    await pumpMinyWidgets(tester,
        child: (_) => const MinyContainer(
              hasCornerSmoothness: false,
              child: icon,
            ));

    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as ShapeDecoration;
    final shape = decoration.shape as SmoothRectangleBorder;
    final borderRadius = shape.borderRadius;

    expect(find.byIcon(Icons.abc), findsOneWidget);
    expect(find.byType(MinyContainer), findsOneWidget);
    expect(borderRadius.topLeft.cornerSmoothing, equals(0));
    expect(borderRadius.topRight.cornerSmoothing, equals(0));
    expect(borderRadius.bottomLeft.cornerSmoothing, equals(0));
    expect(borderRadius.bottomRight.cornerSmoothing, equals(0));
    expect(decoration.color, equals(theme.colors.neutralLightBackground));
    expect(shape.side, equals(BorderSide.none));
    expect(
      borderRadius.bottomLeft.cornerRadius,
      equals(theme.borderradius.small),
    );
    expect(
      borderRadius.bottomRight.cornerRadius,
      equals(theme.borderradius.small),
    );
    expect(
      borderRadius.topLeft.cornerRadius,
      equals(theme.borderradius.small),
    );
    expect(
      borderRadius.topRight.cornerRadius,
      equals(theme.borderradius.small),
    );
    expect(
      container.padding,
      equals(EdgeInsets.all(theme.sizing.height.s3)),
    );
  });

  testWidgets(
      'Given a valid backgroundColor '
      'When MinyContainer is rendered '
      'Then it should applies the given background color',
      (WidgetTester tester) async {
    await pumpMinyWidgets(tester,
        child: (_) => MinyContainer(
              backgroundColor: theme.colors.accentBlue,
              child: icon,
            ));
    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as ShapeDecoration;
    expect(decoration.color, equals(theme.colors.accentBlue));
  });

  testWidgets(
      'Given a valid  borderSide '
      'When MinyContainer is rendered '
      'Then it should apply the given background color',
      (WidgetTester tester) async {
    await pumpMinyWidgets(tester, child: (context) {
      final border = BorderSide(
        width: theme.sizing.width.half,
      );
      return MinyContainer(
        borderSide: border,
        child: icon,
      );
    });
    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as ShapeDecoration;
    final shape = decoration.shape as SmoothRectangleBorder;
    expect(shape.side.width, equals(theme.sizing.width.half));
  });

  testWidgets(
      'Given a valid borderRadius '
      'When MinyContainer is rendered '
      'Then it shlould apply the given border radius',
      (WidgetTester tester) async {
    await pumpMinyWidgets(tester,
        child: (_) => MinyContainer(
              borderRadius: theme.borderradius.xLarge,
              child: icon,
            ));
    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as ShapeDecoration;
    final shape = decoration.shape as SmoothRectangleBorder;
    final borderRadius = shape.borderRadius;

    expect(
      borderRadius.bottomLeft.cornerRadius,
      equals(theme.borderradius.xLarge),
    );
    expect(
      borderRadius.bottomRight.cornerRadius,
      equals(theme.borderradius.xLarge),
    );
    expect(
      borderRadius.topLeft.cornerRadius,
      equals(theme.borderradius.xLarge),
    );
    expect(
      borderRadius.topRight.cornerRadius,
      equals(theme.borderradius.xLarge),
    );
  });
  testWidgets(
      'Given a padding '
      'When MinyContainer is rendered '
      'Then it shlould apply the given padding', (WidgetTester tester) async {
    await pumpMinyWidgets(tester,
        child: (_) => MinyContainer(
              padding: EdgeInsets.all(theme.sizing.height.s3),
              child: icon,
            ));
    final container = tester.widget<Container>(find.byType(Container));
    expect(
      container.padding,
      equals(EdgeInsets.all(theme.sizing.height.s3)),
    );
  });
}
