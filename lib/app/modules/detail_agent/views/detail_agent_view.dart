import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant/app/widgets/custom_navbar.dart';

import '../controllers/detail_agent_controller.dart';

class DetailAgentView extends GetView<DetailAgentController> {
  const DetailAgentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(controller.detailAgent.background!),
            fit: BoxFit.none,
            opacity: 0.1,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: controller.detailAgent.backgroundGradientColors
                .map((e) => HexColor(e))
                .toList(),
          ),
        ),
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomNavBar(title: 'Detail Agent', isBack: true),
              Hero(
                tag: controller.heroTag.value,
                child: Image.network(
                  controller.detailAgent.bustPortrait!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null)
                      return Expanded(
                        child: SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    return child;
                  },
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.detailAgent.displayName.toUpperCase(),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.outfit(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  IconButton.filled(
                    icon: Icon(
                      Icons.info_outline,
                      size: 20,
                    ),
                    onPressed: () => Get.defaultDialog(
                        title: controller.detailAgent.role!.displayName.name,
                        titleStyle: GoogleFonts.outfit(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white),
                        backgroundColor: Colors.black54,
                        contentPadding: const EdgeInsets.all(16.0),
                        content: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Colors.white)),
                              child: Image.network(
                                controller.detailAgent.role!.displayIcon,
                                width: 100,
                                height: 100,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress != null)
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  return child;
                                },
                              ),
                            ),
                            const Gap(15),
                            Text(
                              controller.detailAgent.role!.description,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: Text(
                  controller.detailAgent.description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              const Gap(20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                width: Get.width,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: controller.detailAgent.abilities
                      .asMap()
                      .entries
                      .map(
                        (e) => GestureDetector(
                          onTap: () => controller.currentAbilitiy.value = e.key,
                          child: Obx(() => Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    width: 2,
                                    color: (controller.currentAbilitiy.value ==
                                            e.key)
                                        ? Colors.red
                                        : Colors.white,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        (e.value.displayIcon!.isEmpty)
                                            ? controller
                                                .detailAgent.role!.displayIcon
                                            : e.value.displayIcon!),
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                              )),
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Obx(() => Text(
                      controller
                          .detailAgent
                          .abilities[controller.currentAbilitiy.value]
                          .displayName
                          .toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Obx(() => Text(
                      controller
                          .detailAgent
                          .abilities[controller.currentAbilitiy.value]
                          .description
                          .toLowerCase(),
                      textAlign: TextAlign.justify,
                    )),
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
