import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BrightnessProvider with ChangeNotifier {
  Brightness? brightness;
  Brightness defaultBrightness = Brightness.dark;
  BrightnessProvider() {
    brightness = defaultBrightness;
  }

  setBrightness(Brightness b) {
    brightness = b;
    notifyListeners();
  }
}
