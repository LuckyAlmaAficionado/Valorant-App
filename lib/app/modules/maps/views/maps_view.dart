import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant/app/constant/color.dart';
import 'package:valorant/app/models/maps.dart';
import 'package:valorant/app/routes/app_pages.dart';

import '../controllers/maps_controller.dart';

class MapsView extends GetView<MapsController> {
  const MapsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MapsController());
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('Valorant Maps'),
        backgroundColor: Colors.black12,
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
                return GestureDetector(
                  onTap: () => Get.toNamed(Routes.DETAIL_MAPS, arguments: map),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    height: Get.height * 0.25,
                    width: Get.width,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(map.splash),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(map.displayName.toUpperCase(),
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 35,
                            )),
                        Text(
                          map.coordinates,
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
