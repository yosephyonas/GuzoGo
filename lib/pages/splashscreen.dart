import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:guzogo/pages/homepage/Myhomepage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String initial = '/splashscreen';

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return AnimatedSplashScreen(
      splash: 'assets/images/logo.png',
      nextScreen: const MyHomePage(),
      backgroundColor: const Color(0xFF211E60),
      duration: 3000,
      splashIconSize: screenSize.width * 0.7,
      animationDuration: const Duration(milliseconds: 1300),
    );
  }
}
