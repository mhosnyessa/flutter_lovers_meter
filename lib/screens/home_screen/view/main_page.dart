import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import '../../../providers/pie_provider.dart';
import '../../../providers/brightness_provider.dart';
import '../widgets/widgets.dart';

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
