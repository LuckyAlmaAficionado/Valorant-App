import 'package:get/get.dart';

import '../controllers/detail_maps_controller.dart';

class DetailMapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMapsController>(
      () => DetailMapsController(),
    );
  }
}
