import 'package:flutter/material.dart';

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
    );
  }
}
