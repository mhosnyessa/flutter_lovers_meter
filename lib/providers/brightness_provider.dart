import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BrightnessProvider with ChangeNotifier {
  Brightness? brightness;
  Brightness defaultBrightness = Brightness.dark;
  BrightnessProvider() {
    brightness = defaultBrightness;
  }

  setBrightness(bool b) {
    brightness = b ? Brightness.light : Brightness.dark;
    notifyListeners();
  }
}
