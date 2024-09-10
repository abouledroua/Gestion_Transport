import 'package:flutter/material.dart';

import '../../core/class/responsive.dart';
import '../../core/constant/color.dart';
import '../../core/constant/sizes.dart';
import '../widgets/homepage/drawer_menu.dart';
import 'mywidget.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => MyWidget(
      drawer: !Responsive.isDesktop(context) ? const DrawerMenu() : null,
      backgroundColor: bgColor,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (Responsive.isDesktop(context)) const Expanded(child: DrawerMenu()),
        Expanded(
            flex: 7,
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(appPadding), child: child))
      ]));
}
