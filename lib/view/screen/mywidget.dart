// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/sizes.dart';

class MyWidget extends StatelessWidget {
  final SliverAppBar? mysliver;
  final Widget child;
  bool? showDemo;
  final bool limitWidth;
  final Widget? floatingActionButton;
  String? title;
  final List<Widget>? actions;
  final String? backgroudImage;
  final Color? backgroundColor, appBarColor, leadingIconColor;
  final Widget? drawer, leading;
  Function(bool)? onDrawerChanged;

  MyWidget(
      {GlobalKey<ScaffoldState>? key,
      required this.child,
      this.showDemo,
      this.mysliver,
      this.backgroudImage,
      this.backgroundColor,
      this.appBarColor,
      this.title,
      this.drawer,
      this.limitWidth = false,
      this.leadingIconColor,
      this.actions,
      this.leading,
      this.onDrawerChanged,
      this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    title ??= "";
    showDemo ??= true;
    return SafeArea(
        child: Stack(children: [
      if (backgroudImage != null)
        Positioned.fill(
            child: Image(image: AssetImage(backgroudImage!), fit: BoxFit.fill)),
      Container(
          alignment: Alignment.topCenter,
          child: Container(
              constraints:
                  limitWidth ? const BoxConstraints(maxWidth: maxWidth) : null,
              child: Scaffold(
                  key: key,
                  backgroundColor: backgroundColor ??
                      (backgroudImage != null ? Colors.transparent : white),
                  appBar: title!.isEmpty
                      ? null
                      : AppBar(
                          leadingWidth: 30,
                          automaticallyImplyLeading: false,
                          titleSpacing: 0,
                          iconTheme: const IconThemeData(color: black),
                          elevation: 0,
                          actions: actions,
                          centerTitle: true,
                          backgroundColor:
                              appBarColor ?? Theme.of(context).primaryColor,
                          leading: leading ??
                              (Navigator.canPop(Get.context!)
                                  ? IconButton(
                                      color: leadingIconColor ?? black,
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: const Icon(Icons.arrow_back))
                                  : null),
                          title: FittedBox(
                              child: Text(title!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(color: white)))),
                  floatingActionButton: floatingActionButton,
                  drawer: drawer,
                  onDrawerChanged: onDrawerChanged,
                  resizeToAvoidBottomInset: true,
                  body: Container(
                      decoration: BoxDecoration(
                          gradient: backgroundColor != null
                              ? null
                              : LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                      Colors.grey.shade400,
                                      Colors.grey.shade300,
                                      Colors.grey.shade200
                                    ])),
                      child: child)))),
      // GetBuilder<HomeController>(
      //     builder: (controller) => Center(
      //         child: Visibility(
      //             visible: controller.isVersionDemo && showDemo!,
      //             child: Transform.rotate(
      //                 angle: -pi / 4,
      //                 child: Container(
      //                     padding: const EdgeInsets.all(20),
      //                     width: fullWidth / 2,
      //                     height: fullHeight / 2,
      //                     child: FittedBox(
      //                         child: Center(
      //                             child: Text('Version Démo',
      //                                 style: Theme.of(context)
      //                                     .textTheme
      //                                     .headlineLarge!
      //                                     .copyWith(
      //                                         color:
      //                                             Colors.red.shade100)))))))))
    ]));
  }
}
