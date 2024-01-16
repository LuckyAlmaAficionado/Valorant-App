import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant/app/models/agents.dart';
import 'package:valorant/app/routes/app_pages.dart';

import '../../../constant/color.dart';
import '../controllers/agent_controller.dart';

class AgentView extends GetView<AgentController> {
  const AgentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('010001'),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text(
                    'Discover',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) => Obx(
                      () => ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.listValorantAgent.length,
                        itemBuilder: (context, index) {
                          ValorantAgent agent =
                              controller.listValorantAgent[index];
                          return GestureDetector(
                            onTap: () =>
                                Get.toNamed(Routes.DETAIL_AGENT, arguments: {
                              "valorantAgent": agent,
                              "heroTag": '${agent.uuid}',
                            }),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 16.0),
                              height: Get.height * 0.6,
                              decoration: BoxDecoration(),
                              child: LayoutBuilder(
                                builder: (context, constraints) => Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      height: constraints.maxHeight * 0.8,
                                      width: constraints.maxWidth * 0.85,
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: HexColor('#FD4556'),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      left: 10,
                                      child: Container(
                                        height: constraints.maxHeight,
                                        width: constraints.maxWidth,
                                        child: Hero(
                                          tag: '${agent.uuid}',
                                          child: Image.network(
                                            agent.bustPortrait!,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 25,
                                      bottom: 10,
                                      child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Text(
                                          agent.displayName,
                                          style: TextStyle(
                                            color: Colors.white.withAlpha(170),
                                            fontSize: 50,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// Container(
//                           margin: EdgeInsets.only(bottom: 16.0),
//                           width: constraints.maxWidth,
//                           height: constraints.maxHeight * 0.25,
//                           decoration: BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                               image: NetworkImage(agent.background!),
//                               fit: BoxFit.none,
//                               opacity: 0.2,
//                             ),
//                           ),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   agent.displayName,
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontFamily: 'Valorant',
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                               ),
//                               Hero(
//                                 tag: '${agent.uuid}',
//                                 child: Image.network(
//                                   agent.bustPortrait!,
//                                   fit: BoxFit.cover,
//                                   loadingBuilder:
//                                       (context, child, loadingProgress) {
//                                     if (loadingProgress != null)
//                                       return SizedBox(
//                                         width: constraints.maxWidth * 0.5,
//                                         child: Center(
//                                           child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       );
//                                     return child;
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

class NavBarAgent extends StatelessWidget {
  const NavBarAgent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        primaryColor,
        secondaryColor,
      ])),
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const Gap(10),
            Text(
              'Valorant Dashboard',
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
