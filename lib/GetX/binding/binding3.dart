import 'package:get/get.dart';
import 'package:guzogo/GetX/controller/controller2.dart';

class AirportDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PassengerController());
  }
}
