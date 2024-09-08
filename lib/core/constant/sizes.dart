import 'dart:math';

import 'package:flutter/material.dart';

const double maxWidth = 800;
late double widthScreen, heightScreen;

const appPadding = 16.0;

setSizeScreen(context) {
  widthScreen = min(MediaQuery.of(context).size.width, maxWidth);
  heightScreen = MediaQuery.of(context).size.height;
}
