import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/detail_agent_controller.dart';

class DetailAgentView extends GetView<DetailAgentController> {
  const DetailAgentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('The Agents'),
        backgroundColor:
            HexColor(controller.detailAgent.backgroundGradientColors[0]),
        centerTitle: true,
        actions: [
          Icon(
            Icons.widgets,
            color: HexColor('#FFFBF5'),
          ),
          const Gap(10),
        ],
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(controller.detailAgent.background!),
            fit: BoxFit.none,
            opacity: 0.05,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: controller.detailAgent.backgroundGradientColors
                .map((e) => HexColor(e))
                .toList(),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Image
              Container(
                width: Get.width,
                height: 550,
                child: Stack(
                  children: [
                    Positioned(
                      top: 60,
                      left: 25,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          controller.detailAgent.displayName.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white.withOpacity(0.25),
                            fontSize: 70,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Hero(
                        tag: controller.heroTag.value,
                        child: Image.network(
                          controller.detailAgent.bustPortrait!,
                          fit: BoxFit.cover,
                          height: 550,
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
                    ),
                    Positioned(
                      right: 20,
                      top: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            controller.detailAgent.displayName.toUpperCase(),
                            style: TextStyle(
                              color: HexColor('#FD4556'),
                              fontSize: 28,
                            ),
                          ),
                          Text(
                            controller.detailAgent.role!.displayName.name,
                            style: TextStyle(
                              color: HexColor('#FFFBF5'),
                              fontSize: 16,
                            ),
                          ),
                          const Gap(10),
                          Container(
                            height: 5,
                            width: 60,
                            color: Colors.white,
                          ),
                          const Gap(10),
                          Container(
                            width: 60,
                            child: Column(
                              children: controller.detailAgent.abilities
                                  .asMap()
                                  .entries
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          print(e.value.description);
                                          Get.defaultDialog(
                                            backgroundColor: Colors.white,
                                            title: e.value.displayName,
                                            titleStyle: GoogleFonts.outfit(),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 40,
                                            ),
                                            content: Text(
                                              e.value.description,
                                              textAlign: TextAlign.justify,
                                              style: GoogleFonts.outfit(
                                                fontSize: 16,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          margin: EdgeInsets.only(bottom: 10),
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.white,
                                            ),
                                          ),
                                          child: Image.network(
                                            e.value.displayIcon!,
                                            loadingBuilder: (context, child,
                                                    loadingProgress) =>
                                                (loadingProgress == null)
                                                    ? child
                                                    : CircularProgressIndicator(),
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Icon(
                                              Icons.error_outline,
                                              size: 50,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // const Gap(20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       controller.detailAgent.displayName.toUpperCase(),
              //       textAlign: TextAlign.right,
              //       style: GoogleFonts.outfit(
              //         fontSize: 40,
              //         fontWeight: FontWeight.w600,
              //         color: Colors.black,
              //       ),
              //     ),
              //     IconButton.filled(
              //       icon: Icon(
              //         Icons.info_outline,
              //         size: 20,
              //       ),
              //       onPressed: () => Get.defaultDialog(
              //           title: controller.detailAgent.role!.displayName.name,
              //           titleStyle: GoogleFonts.outfit(
              //               fontWeight: FontWeight.w600,
              //               fontSize: 20,
              //               color: Colors.white),
              //           backgroundColor: Colors.black54,
              //           contentPadding: const EdgeInsets.all(16.0),
              //           content: Column(
              //             children: [
              //               Container(
              //                 decoration: BoxDecoration(
              //                     border: Border.all(
              //                         width: 2, color: Colors.white)),
              //                 child: Image.network(
              //                   controller.detailAgent.role!.displayIcon,
              //                   width: 100,
              //                   height: 100,
              //                   loadingBuilder:
              //                       (context, child, loadingProgress) {
              //                     if (loadingProgress != null)
              //                       return const Center(
              //                           child: CircularProgressIndicator());
              //                     return child;
              //                   },
              //                 ),
              //               ),
              //               const Gap(15),
              //               Text(
              //                 controller.detailAgent.role!.description,
              //                 textAlign: TextAlign.justify,
              //                 style: GoogleFonts.outfit(
              //                   color: Colors.white,
              //                 ),
              //               )
              //             ],
              //           )),
              //     ),
              //   ],
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(26.0),
              //   child: Text(
              //     controller.detailAgent.description,
              //     textAlign: TextAlign.justify,
              //     style: GoogleFonts.outfit(
              //       color: Colors.black,
              //       fontSize: 16,
              //     ),
              //   ),
              // ),
              // const Gap(20),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 26),
              //   width: Get.width,
              //   height: 100,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: controller.detailAgent.abilities
              //         .asMap()
              //         .entries
              //         .map(
              //           (e) => GestureDetector(
              //             onTap: () => controller.currentAbilitiy.value = e.key,
              //             child: Obx(() => Container(
              //                   height: 60,
              //                   width: 60,
              //                   decoration: BoxDecoration(
              //                     color: Colors.black12,
              //                     borderRadius: BorderRadius.circular(4),
              //                     border: Border.all(
              //                       width: 2,
              //                       color: (controller.currentAbilitiy.value ==
              //                               e.key)
              //                           ? Colors.red
              //                           : Colors.white,
              //                     ),
              //                     image: DecorationImage(
              //                       image: NetworkImage(
              //                           (e.value.displayIcon!.isEmpty)
              //                               ? controller
              //                                   .detailAgent.role!.displayIcon
              //                               : e.value.displayIcon!),
              //                       filterQuality: FilterQuality.high,
              //                     ),
              //                   ),
              //                 )),
              //           ),
              //         )
              //         .toList(),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 26),
              //   child: Obx(() => Text(
              //         controller
              //             .detailAgent
              //             .abilities[controller.currentAbilitiy.value]
              //             .displayName
              //             .toUpperCase(),
              //         textAlign: TextAlign.center,
              //         style: GoogleFonts.outfit(
              //             fontSize: 30,
              //             color: Colors.black,
              //             fontWeight: FontWeight.w600),
              //       )),
              // ),
              // const Gap(10),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 26),
              //   child: Obx(() => Text(
              //         controller
              //             .detailAgent
              //             .abilities[controller.currentAbilitiy.value]
              //             .description
              //             .toLowerCase(),
              //         textAlign: TextAlign.justify,
              //       )),
              // ),
              // const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
