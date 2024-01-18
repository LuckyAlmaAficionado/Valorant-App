import 'package:get/get.dart';

import '../controllers/weapons_controller.dart';

class WeaponsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeaponsController>(
      () => WeaponsController(),
    );
  }
}
