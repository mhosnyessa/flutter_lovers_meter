import 'package:flutter/material.dart';

import '../../../providers/pie_provider.dart';

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
