import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/user.dart';
import '../core/constant/sizes.dart';
import '../core/services/settingservice.dart';

class PrivacyController extends GetxController {
  bool accept = false;

  updateAccepte() {
    accept = !accept;
    update();
  }

  Future<bool> onWillPop() async => false;

  continuer() {
    SettingServices c = Get.find();
    c.sharedPrefs.setString("Privacy${User.idUser}", "1");
    Get.back();
  }

  @override
  void onInit() {
    WidgetsFlutterBinding.ensureInitialized();
    setSizeScreen(Get.context);
    super.onInit();
  }
}
