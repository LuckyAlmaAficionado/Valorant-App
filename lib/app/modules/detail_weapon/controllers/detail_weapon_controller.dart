import 'package:get/get.dart';
import 'package:valorant/app/models/weapons.dart';

class DetailWeaponController extends GetxController {
  Rxn<ValorantWeapon> weapon = Rxn<ValorantWeapon>();

  initWeapon(ValorantWeapon weapon) {
    this.weapon.value = weapon;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
