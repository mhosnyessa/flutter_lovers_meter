import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pie_chart_provider/brightness_provider.dart';
import 'package:pie_chart_provider/pie_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart' as fns;

void main() {
  runApp(PieChartApp());
}

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

class PieHomePage extends StatelessWidget {
  const PieHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PieProvider>(
      create: (_) => PieProvider(
        flutterValInit: 5,
        hatersValInit: 2,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Lovers Meter'),
          centerTitle: true,
          elevation: 0.0,
          actions: [
            Consumer<BrightnessProvider>(
              builder: (_, notifier, w) => Switch(
                value: notifier.brightness == Brightness.light ? true : false,
                onChanged: notifier.setBrightness,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<PieProvider>(
                  builder: (ctx, notifier, widget) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: PieChart(
                      chartValuesOptions: ChartValuesOptions(),
                      legendOptions:
                          LegendOptions(legendPosition: LegendPosition.bottom),
                      dataMap: <String, double>{
                        'flutter lovers': notifier.flutterVal!,
                        'haters': notifier.hatersVal!,
                      },
                      colorList: [
                        Colors.blue,
                        Colors.red,
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Consumer<PieProvider>(
                  builder: (_, notifier, widget) => SliderChart(
                    traylingText: '😍',
                    pieProvider: notifier,
                    value: notifier.flutterVal!,
                    onChange: (val) {
                      notifier.setFlutterVal(val);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<PieProvider>(
                  builder: (_, notifier, widget) => SliderChart(
                    traylingText: '😕',
                    value: notifier.hatersVal!,
                    pieProvider: notifier,
                    color: Colors.red,
                    onChange: (val) {
                      notifier.setHatersVal(val);
                    },
                  ),
                ),
              ],
            ),
            RightsFooter(),
          ],
        ),
      ),
    );
  }
}

class RightsFooter extends StatelessWidget {
  const RightsFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyText1,
          children: [
            TextSpan(
              text: 'Developed by',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    // color: Colors.red[900],
                    // fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
            ),
            TextSpan(
              text: ' ' + 'Muhammed Hosny✌️',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                  ),
            ),
            TextSpan(
              text: '\nAll rights reserved ©2022',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    // color: Colors.red[900],
                    // fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ],
        ),
      ),
// 'developed by Muhammed Hosny \nall rights reserved ©2022 '
    );
  }
}

class SliderChart extends StatelessWidget {
  final PieProvider pieProvider;
  final Color color;
  final double value;
  final String traylingText;
  final void Function(double) onChange;
  const SliderChart({
    Key? key,
    required this.pieProvider,
    this.color = Colors.blue,
    required this.onChange,
    required this.value,
    required this.traylingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          // child: Text(
          //   '😕',
          //   style: Theme.of(context).textTheme.headline3,
          // ),
        ),
        Flexible(
          // flex: 1,
          child: Slider(
            divisions: 10,
            activeColor: color,
            inactiveColor: color.withOpacity(0.05),
            min: 0,
            max: 10,
            onChanged: onChange,
            value: value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            traylingText,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ],
    );
  }
}
