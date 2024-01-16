import 'package:get/get.dart';
import 'package:valorant/app/models/maps.dart';

class DetailMapsController extends GetxController {
  Rxn<ValorantMaps> map = Rxn<ValorantMaps>();

  initMap(ValorantMaps map) {
    this.map.value = map;
  }

  @override
  void onInit() {
    super.onInit();
    initMap(Get.arguments);
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
