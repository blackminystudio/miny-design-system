import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

const testLabel = 'continue';
const iconPath = 'assets/images/testImage.png';

Future<void> pumpMinyWidgets(
  WidgetTester tester, {
  required Widget child,
}) async {
  final widgetScreen = ScreenUtilInit(
    designSize: const Size(440, 956),
    minTextAdapt: true,
    builder: (context, _) => MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(body: child),
    ),
  );
  await tester.pumpWidget(widgetScreen);
}
