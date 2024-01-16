import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant/app/models/agents.dart';
import 'package:valorant/app/routes/app_pages.dart';

import '../../../constant/color.dart';
import '../controllers/agent_controller.dart';

class AgentView extends GetView<AgentController> {
  const AgentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        children: [
          NavBarAgent(),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => Obx(
                () => ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.listValorantAgent.length,
                    itemBuilder: (context, index) {
                      ValorantAgent agent = controller.listValorantAgent[index];
                      return GestureDetector(
                        onTap: () =>
                            Get.toNamed(Routes.DETAIL_AGENT, arguments: {
                          "valorantAgent": agent,
                          "heroTag": '${agent.uuid}',
                        }),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16.0),
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(agent.background!),
                              fit: BoxFit.none,
                              opacity: 0.2,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  agent.displayName,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Hero(
                                tag: '${agent.uuid}',
                                child: Image.network(
                                  agent.bustPortrait!,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress != null)
                                      return SizedBox(
                                        width: constraints.maxWidth * 0.5,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    return child;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

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
