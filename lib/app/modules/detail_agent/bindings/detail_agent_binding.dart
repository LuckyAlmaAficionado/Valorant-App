import 'package:get/get.dart';

import '../controllers/detail_agent_controller.dart';

class DetailAgentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAgentController>(
      () => DetailAgentController(),
    );
  }
}
