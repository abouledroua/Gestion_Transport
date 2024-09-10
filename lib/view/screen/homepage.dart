import 'package:flutter/material.dart';

import '../../core/class/responsive.dart';
import '../../core/constant/sizes.dart';
import '../widgets/homepage/custom_appbar.dart';
import 'myscreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => MyScreen(
          child: Column(children: [
        const CustomAppbar(),
        const SizedBox(height: appPadding),
        Column(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                flex: 5,
                child: Column(children: [
                  // const AnalyticCards(),
                  const SizedBox(height: appPadding),
                  // const Users(),
                  if (Responsive.isMobile(context))
                    const SizedBox(height: appPadding),
                  // if (Responsive.isMobile(context)) const Discussions()
                ])),
            if (!Responsive.isMobile(context))
              const SizedBox(width: appPadding),
            // if (!Responsive.isMobile(context)) const Expanded(flex: 2, child: Discussions())
          ]),
          // Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //   Expanded(
          //       flex: 5,
          //       child: Column(children: [
          //         const SizedBox(height: appPadding),
          //         Row(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               if (!Responsive.isMobile(context))
          //                 const Expanded(flex: 2, child: TopReferals()),
          //               if (!Responsive.isMobile(context))
          //                 const SizedBox(width: appPadding),
          //               const Expanded(flex: 3, child: Viewers())
          //             ]),
          //         const SizedBox(height: appPadding),
          //         if (Responsive.isMobile(context))
          //           const SizedBox(height: appPadding),
          //         if (Responsive.isMobile(context)) const TopReferals(),
          //         if (Responsive.isMobile(context))
          //           const SizedBox(height: appPadding),
          //         if (Responsive.isMobile(context)) const UsersByDevice()
          //       ])),
          //   if (!Responsive.isMobile(context))
          //     const SizedBox(width: appPadding),
          //   if (!Responsive.isMobile(context))
          //     const Expanded(flex: 2, child: UsersByDevice())
          // ])
        ])
      ]));
}
