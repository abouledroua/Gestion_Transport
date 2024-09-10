import 'dart:math';

import 'package:flutter/material.dart';

const double maxWidth = 800;
late double widthScreen, heightScreen, fullHeight, fullWidth;

const appPadding = 16.0;

setSizeScreen(context) {
  widthScreen = min(MediaQuery.of(context).size.width, maxWidth);
  heightScreen = MediaQuery.of(context).size.height;

  fullHeight = MediaQuery.of(context).size.height;
  fullWidth = MediaQuery.of(context).size.width;
}
