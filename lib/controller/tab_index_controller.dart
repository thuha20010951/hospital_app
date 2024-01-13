import 'package:get/get.dart';

class TabIndexController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex({required index}) {
    currentIndex.value = index;
  }
}
