import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miny_design_system/miny_design_system.dart';

void main() => runApp(
      ScreenUtilInit(
        designSize: const Size(440, 956),
        minTextAdapt: true,
        builder: (context, _) => const MinyDesignSystemExample(),
      ),
    );

class MinyDesignSystemExample extends StatefulWidget {
  const MinyDesignSystemExample({super.key});

  @override
  State<MinyDesignSystemExample> createState() =>
      _MinyDesignSystemExampleState();
}

class _MinyDesignSystemExampleState extends State<MinyDesignSystemExample> {
  // final bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MinyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: MinyButton(
                label: "Sign up with google",
                onPressed: () {},
                enableIcon: true,
                iconPath: null,
                // 'packages/miny_design_system/assets/images/google_icon.png',
              )),
        ),
      ),
    );
  }
}
