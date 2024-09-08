import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/dashboard_controller.dart';
import '../../../core/constant/color.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.myIndex,
      this.color});

  final int myIndex;
  final IconData? icon;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) => GetBuilder<DashBoardController>(
      builder: (controller) => ListTile(
          onTap: () {
            controller.setIndex(myIndex);
          },
          tileColor:
              controller.currentIndex == myIndex ? blue1 : Colors.transparent,
          leading: Icon(icon, color: color ?? grey),
          title: Text(title,
              style: controller.currentIndex == myIndex
                  ? Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: color ?? white)
                  : Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: color ?? grey))));
}
