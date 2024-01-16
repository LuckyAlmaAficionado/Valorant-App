import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant/app/constant/color.dart';
import 'package:valorant/app/models/agents.dart';
import 'package:valorant/app/models/maps.dart';

import '../controllers/maps_controller.dart';

class MapsView extends GetView<MapsController> {
  const MapsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MapsController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Valorant Maps'),
        backgroundColor: primaryColor,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Obx(
          () => ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: controller.valorantMaps.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                ValorantMaps map = controller.valorantMaps[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  height: Get.height * 0.25,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          map.premierBackgroundImage,
                        ),
                      )),
                  child: Center(
                    child: Text(
                      map.displayName.toUpperCase(),
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
