import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/class/responsive.dart';
import '../../../core/class/user.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/sizes.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) => Row(children: [
        Padding(
            padding: const EdgeInsets.all(appPadding),
            child: Stack(children: [
              SvgPicture.asset("assets/icons/Bell.svg",
                  height: 25, color: textColor.withOpacity(0.8)),
              Positioned(
                  right: 0,
                  child: Container(
                      height: 10,
                      width: 10,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: red)))
            ])),
        Container(
            margin: const EdgeInsets.only(left: appPadding),
            padding: const EdgeInsets.symmetric(
                horizontal: appPadding, vertical: appPadding / 2),
            child: Row(children: [
              const Icon(Icons.person),
              if (!Responsive.isMobile(context))
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: appPadding / 2),
                    child: Text('Hi, ${User.username}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: textColor, fontWeight: FontWeight.w800)))
            ]))
      ]);
}
