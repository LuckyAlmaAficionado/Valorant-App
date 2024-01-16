import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:valorant/app/models/maps.dart';

class MapsController extends GetxController {
  var valorantMaps = <ValorantMaps>[].obs;

  fetchMaps() async {
    Uri url = Uri.parse('https://valorant-api.com/v1/maps?language=id-ID');
    try {
      var response = await http.get(url);
      var data = json.decode(response.body);
      if (data['status'] == 200) {
        List listMap = (data['data'] as List);
        valorantMaps.value = listMap
            .map((e) => ValorantMaps.fromJson(e))
            .where((element) => !element.premierBackgroundImage.isEmpty)
            .toList();
      }
      valorantMaps.refresh();
    } catch (e) {
      throw ('Error => $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchMaps();
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
