import 'package:flutter/material.dart';
import 'package:guzogo/pages/splashscreen.dart';

import 'pages/homepage/Myhomepage.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    MyHomePage.route: (context) => const MyHomePage(),
    SplashScreen.initial: (context) => const SplashScreen(),
  };
}
