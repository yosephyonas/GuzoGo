import 'package:get/get.dart';

class AirportControllerTo extends GetxController {
  RxString selectedAirportName = RxString('');
  RxString selectedAirportCode = RxString('');
  RxString selectedAirportCountry = RxString('');

  void selectedAirport(String name, String code, String country) {
    selectedAirportName.value = name;
    selectedAirportCode.value = code;
    selectedAirportCountry.value = country;
  }
}

class AirportControllerFrom extends GetxController {
  RxString selectedAirportName = RxString('');
  RxString selectedAirportCode = RxString('');
  RxString selectedAirportCountry = RxString('');

  void selectedAirport(String name, String code, String country) {
    selectedAirportName.value = name;
    selectedAirportCode.value = code;
    selectedAirportCountry.value = country;
  }
}
