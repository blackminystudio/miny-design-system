import 'package:flutter/material.dart';
import 'package:miny_design_system/miny_design_system.dart';

void main() => runApp(MinyDesignSystemExample());

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MinyTextField(
                  hintText: "Enter City",
                ),
                SizedBox(height: 10),
                // MinyButton(
                //   label: "Get Started",
                //   isLoading: _isLoading,
                //   onPressed: () async {
                //     setState(() {
                //       _isLoading = true;
                //     });
                //     await Future.delayed(Duration(seconds: 2));
                //     setState(() {
                //       _isLoading = false;
                //     });
                //   },
                // ),
                ChoiceChip(
                  label: Text(
                    "data",
                    style: Theme.of(context).textStyle.bodyLarge,
                  ),
                  selected: false,
                  onSelected: (value) {
                    value = !value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
