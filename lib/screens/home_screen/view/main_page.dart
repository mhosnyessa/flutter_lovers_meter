import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pie_chart_provider/config/palette.dart';
import 'package:provider/provider.dart';
import '../../../providers/pie_provider.dart';
import '../../../providers/brightness_provider.dart';
import '../widgets/widgets.dart';
import 'drawer.dart';

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
        body: ScaffoldBody(),
        drawer: MainDrawer(),
      ),
    );
  }
}

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    Palette.flutterColor,
                    Palette.hatersColor,
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
                color: Palette.flutterColor,
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
                color: Palette.hatersColor,
                onChange: (val) {
                  notifier.setHatersVal(val);
                },
              ),
            ),
          ],
        ),
        RightsFooter(),
      ],
    );
  }
}
