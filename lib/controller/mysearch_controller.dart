import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/color.dart';
import '../core/constant/routes.dart';
import '../core/constant/sizes.dart';

class MySearchController extends GetxController {
  late TextEditingController queryController;
  String erreur = "";
  int type = 0;
  bool valider = false, wrongCredent = false, erreurServeur = false;

  Future<bool> onWillPop() async =>
      (await showDialog(
          context: Get.context!,
          builder: (context) => AlertDialog(
                  title: Row(children: [
                    Icon(Icons.exit_to_app_sharp, color: red),
                    const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Etes-vous sur ?'))
                  ]),
                  content: const Text(
                      "Voulez-vous vraiment annuler l'authentification ?"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Get.back(result: false),
                        child: Text('Non', style: TextStyle(color: red))),
                    TextButton(
                        onPressed: () {
                          Get.offAllNamed(AppRoute.login);
                        },
                        child: Text('Oui', style: TextStyle(color: green)))
                  ]))) ??
      false;

  setValider(pValue) {
    valider = pValue;
    update();
  }

  updateType(int value) {
    type = value;
    update();
  }

  @override
  void onInit() {
    WidgetsFlutterBinding.ensureInitialized();
    initConnect();
    super.onInit();
  }

  initConnect() {
    setSizeScreen(Get.context);
    queryController = TextEditingController();
  }

  @override
  void onClose() {
    queryController.dispose();
    super.onClose();
  }
}
