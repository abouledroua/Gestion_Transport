import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OldHomeController extends GetxController {
  bool _versionDemo = true;

  get isVersionDemo => _versionDemo;

  setVersionDemo(bool value) {
    _versionDemo = value;
    update();
  }

  @override
  void onInit() {
    WidgetsFlutterBinding.ensureInitialized();
    _versionDemo = true;
    super.onInit();
  }
}
