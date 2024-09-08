import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/sizes.dart';

class Viewers extends StatelessWidget {
  const Viewers({super.key});

  @override
  Widget build(BuildContext context) => Container(
      height: 350,
      padding: const EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child:
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Viewers',
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w700, fontSize: 15))
      ]));
}
