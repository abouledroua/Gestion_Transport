import 'package:flutter/material.dart';
import 'package:gestion_transport/core/class/analytic_info_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/sizes.dart';

class AnalyticInfoCard extends StatelessWidget {
  const AnalyticInfoCard({super.key, required this.info});

  final AnalyticInfo info;

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(
          horizontal: appPadding, vertical: appPadding / 2),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("${info.count}",
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w800)),
              Container(
                  padding: const EdgeInsets.all(appPadding / 2),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: info.color!.withOpacity(0.1),
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(info.svgSrc!, color: info.color))
            ]),
            Text(info.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600))
          ]));
}
