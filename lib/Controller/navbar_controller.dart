import 'package:get/get_state_manager/get_state_manager.dart';

class NavBarController extends GetxController {
  int selectedIndex = 0;
  void changeIndex(index) {
    selectedIndex = index;
    update();
  }
}
