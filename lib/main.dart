import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';
import 'core/constant/data.dart';
import 'core/constant/theme.dart';
import 'core/services/settingservice.dart';
import 'routes.dart';
import 'view/screen/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  if (AppData.isAndroidAppMobile) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]).then((value) => runApp(const MyApp()));
}

Future initialService() async {
  Get.put(HomeController());
  await Get.putAsync(() => SettingServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion Transport',
      routes: routes,
      home: const WelcomePage(),
      theme: myTheme(context));
}
