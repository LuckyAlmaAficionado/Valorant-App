import 'package:get/get.dart';
import 'package:valorant/app/models/agents.dart';

class DetailAgentController extends GetxController {
  late ValorantAgent detailAgent;
  var heroTag = ''.obs;
  var currentAbilitiy = 0.obs;

  initValorantAgent(Map<String, dynamic> arguments) {
    detailAgent = arguments['valorantAgent'];
    heroTag.value = arguments['heroTag'];
  }

  @override
  void onInit() {
    super.onInit();
    initValorantAgent(Get.arguments);
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
