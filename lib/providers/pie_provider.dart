import 'package:flutter/widgets.dart';

class PieProvider with ChangeNotifier {
  double? flutterVal;
  double flutterValInit;
  double? hatersVal;
  double hatersValInit;
  PieProvider({
    required this.flutterValInit,
    required this.hatersValInit,
  }) {
    flutterVal = flutterValInit;
    hatersVal = hatersValInit;
  }

  void setFlutterVal(double val) {
    flutterVal = val;
    notifyListeners();
  }

  void setHatersVal(double val) {
    hatersVal = val;
    notifyListeners();
  }
}
