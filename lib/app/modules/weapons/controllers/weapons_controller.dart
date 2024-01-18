import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:valorant/app/models/weapons.dart';

class WeaponsController extends GetxController {
  initWeaponsFromAPI() async {
    List<ValorantWeapon> weapons = [];
    try {
      var response = await http
          .get(Uri.parse('https://valorant-api.com/v1/weapons?language=id-ID'));

      var data = json.decode(response.body);
      if (data['status'] == 200) {
        weapons = (data['data'] as List)
            .map((e) => ValorantWeapon.fromJson(e))
            .toList();
      }

      return weapons;
    } catch (e) {
      throw ('Error initWeaponFromAPI: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    initWeaponsFromAPI();
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
