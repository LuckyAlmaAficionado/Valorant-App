import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:valorant/app/models/agents.dart';

class AgentController extends GetxController {
  var listValorantAgent = <ValorantAgent>[].obs;

  fetchDataValorantAgentByUuid(String uuid) async {
    Uri url =
        Uri.parse('https://valorant-api.com/v1/agents/$uuid?language=id-ID');
    try {
      var response = await http.get(url);
      var data = ResponseValorantAgent.fromJson(json.decode(response.body));

      // check status
      if (data.status == 200) {
        ValorantAgent agent = data.data;
        print(agent.description);
      }
    } catch (e) {
      throw ('error fetchDataValorantAgentByUuid: $e');
    }
  }

  fetchDataValorantAgents() async {
    // agar tidak terjadi kebocoran data
    listValorantAgent.clear();

    Uri url = Uri.parse('https://valorant-api.com/v1/agents?language=id-ID');
    try {
      var response = await http.get(url);
      var data = ResponseValorantAPI.fromJson(json.decode(response.body));

      print('data status: ${data.status}');

      // check status
      if (data.status == 200) {
        listValorantAgent.addAll(data.data);

        listValorantAgent.removeWhere((element) =>
            element.uuid == "ded3520f-4264-bfed-162d-b080e2abccf9");

        return listValorantAgent;
      } else {
        throw ('error fetching valorant agent');
      }
    } catch (error) {
      throw ('error $error');
    }
  }
}
