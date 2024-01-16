import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_maps_controller.dart';

class DetailMapsView extends GetView<DetailMapsController> {
  const DetailMapsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.initMap(Get.arguments);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          controller.map.value!.displayName.toUpperCase(),
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(controller.map.value!.listViewIconTall),
            fit: BoxFit.fitWidth,
            opacity: 0.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                controller.map.value!.displayName.toUpperCase(),
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                controller.map.value!.coordinates.toUpperCase(),
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Container(
                    width: Get.width * 0.4,
                    height: 5,
                    color: Colors.white,
                  ),
                  const Gap(10),
                  Text(
                    controller.map.value!.tacticalDescription,
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Container(
              width: Get.width,
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 0.5,
                maxScale: 2,
                child: SizedBox(
                  child: Image.network(
                    controller.map.value!.displayIcon,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            const Gap(20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  controller.map.value!.narrativeDescription.toLowerCase(),
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
