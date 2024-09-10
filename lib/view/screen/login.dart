import 'package:flutter/material.dart';
import 'package:blinking_text/blinking_text.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../controller/login_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/data.dart';
import '../widgets/login/imageheaderlogin.dart';
import '../widgets/login/logincredentialwidget.dart';
import 'mywidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    HomeController hControler = Get.find();
    bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    LoginController controller = Get.put(LoginController());
    int hour = TimeOfDay.now().hour;
    return MyWidget(
        limitWidth: true,
        showDemo: false,
        backgroundColor: white,
        child: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              controller.onWillPop();
            },
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Stack(children: [
                  SingleChildScrollView(
                      child: Column(children: [
                    const SizedBox(height: 14),
                    const ImageHeaderLogin(),
                    const SizedBox(height: 14),
                    Center(
                        child: Text(hour < 13 ? 'Bonjour' : 'Bonsoir',
                            style: Theme.of(context).textTheme.headlineLarge)),
                    const SizedBox(height: 6),
                    Center(
                        child: Text('Connectez-vous à votre compte',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: greyblack))),
                    const LoginCredentialWidget(),
                    if (hControler.isVersionDemo)
                      BlinkText('Version Démo',
                          style: Theme.of(context).textTheme.headlineLarge,
                          beginColor: white,
                          endColor: red)
                  ])),
                  if (!keyboardVisible)
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                              child: Text(
                                  'Serveur : ${AppData.getServerName()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: greyblack))),
                          const SizedBox(height: 6)
                        ])
                ]))));
  }
}
