import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/brightness_provider.dart';
import 'screens/home_screen/home_screen.dart';

class PieChartApp extends StatelessWidget {
  const PieChartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BrightnessProvider>(
      create: (_) => BrightnessProvider(),
      child: Consumer<BrightnessProvider>(
        builder: (_, notifier, widget) => MaterialApp(
          home: PieHomePage(),
          theme: ThemeData(
            brightness: notifier.brightness,
          ),
        ),
      ),
    );
  }
}
