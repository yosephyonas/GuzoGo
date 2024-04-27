import 'package:get/get.dart';

import '../controller/controller.dart';

class AirportDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AirportControllerTo());
  }
}
