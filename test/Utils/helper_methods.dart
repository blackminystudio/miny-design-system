import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miny_design_system/miny_design_system.dart';

final theme = ThemeData.light();
const icon = Icon(Icons.abc);
const testLabel = 'continue';
const iconPath = 'assets/images/testImage.png';

Future<void> pumpMinyWidgets(
  WidgetTester tester, {
  required Widget Function(BuildContext context) child,
  Size designSize = const Size(440, 956),
}) async {
  final widget = ScreenUtilInit(
    designSize: designSize,
    minTextAdapt: true,
    builder: (context, _) => MaterialApp(
      theme: MinyTheme.lightTheme,
      home: Builder(
        builder: (context) => Scaffold(
          body: child(context),
        ),
      ),
    ),
  );

  await tester.pumpWidget(widget);
}
