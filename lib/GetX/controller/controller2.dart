import 'package:get/get.dart';

class PassengerController extends GetxController {
  RxInt adultCount = 1.obs;
  RxInt childCount = 0.obs;
  RxInt infantCount = 0.obs;

  void incrementCount(String type) {
    if (type == 'Adult') {
      adultCount++;
    } else if (type == 'Child') {
      childCount++;
    } else if (type == 'Infant') {
      infantCount++;
    }
  }

  void decrementCount(String type) {
    if (type == 'Adult') {
      if (adultCount > 0) {
        adultCount--;
      }
    } else if (type == 'Child') {
      if (childCount > 0) {
        childCount--;
      }
    } else if (type == 'Infant') {
      if (infantCount > 0) {
        infantCount--;
      }
    }
  }
}
