import 'package:get/get.dart';

class Notify {
  final isiconplay = false.obs;
  final isheartpresed = false.obs;
  void seticonplay(bool value) {
    isiconplay.value = value;
  }

  void setheartpressed(bool value) {
    isheartpresed.value = value;
  }
}
