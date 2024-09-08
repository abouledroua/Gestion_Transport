import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/welcome_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/data.dart';
import '../../core/constant/image_asset.dart';
import '../../core/constant/sizes.dart';
import '../../core/services/settingservice.dart';
import 'mywidget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    Get.put(WelcomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.setSizeScreen(context);
    SettingServices ss = Get.find();
    return MyWidget(
        showDemo: false,
        backgroundColor: AppColor.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              constraints:
                  BoxConstraints(maxWidth: (AppSizes.widthScreen / 2) - 20),
              padding: const EdgeInsets.all(28.0),
              child: Image.asset(AppImageAsset.logo, fit: BoxFit.contain)),
          SizedBox(height: AppSizes.heightScreen / 20),
          Center(
              child: Text("Gestion Transport",
                  style: Theme.of(context).textTheme.headlineLarge)),
          const SizedBox(height: 10),
          Center(
              child: Text(
                  "Version : ${(kIsWeb) ? AppData.webVersion : ss.packageInfo.version}",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColor.greyblack))),
        ]));
  }
}
