import 'package:get/get.dart';

import '../controllers/detail_weapon_controller.dart';

class DetailWeaponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailWeaponController>(
      () => DetailWeaponController(),
    );
  }
}
