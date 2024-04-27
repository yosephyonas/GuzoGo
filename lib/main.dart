import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guzogo/GetX/controller/controller2.dart';
import 'package:guzogo/pages/splashscreen.dart';
import 'package:guzogo/routes.dart';

void main() {
  Get.put(PassengerController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(
              primaryColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
              )),
          debugShowCheckedModeBanner: false,
          routes: Routes.routes,
          initialRoute: SplashScreen.initial,
        );
      },
    );
  }
}
