import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant/app/models/weapons.dart';
import 'package:valorant/app/routes/app_pages.dart';

import '../controllers/weapons_controller.dart';

class WeaponsView extends GetView<WeaponsController> {
  const WeaponsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.all(26.0),
                child: Text(
                  'Weapons',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: controller.initWeaponsFromAPI(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    List<ValorantWeapon> weapons =
                        (snapshot.data as List<ValorantWeapon>);
                    return ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: weapons.length,
                        itemBuilder: (context, index) {
                          ValorantWeapon weapon = weapons[index];
                          return GestureDetector(
                            onTap: () => Get.toNamed(
                              Routes.DETAIL_WEAPON,
                              arguments: {
                                "heroTag": "$index${weapon.uuid}",
                                "weapon": weapon,
                              },
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 90.0),
                              width: Get.width,
                              height: Get.height * 0.23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor('#FD4556'),
                              ),
                              child: LayoutBuilder(
                                builder: (context, constraints) => Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(30 / 360),
                                      child: Image.network(
                                        weapon.displayIcon,
                                        width: 400,
                                        height: Get.height,
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.contain,
                                        loadingBuilder: (context, child,
                                                loadingProgress) =>
                                            (loadingProgress != null)
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator())
                                                : child,
                                      ),
                                    ),
                                    Positioned(
                                      child: Text(
                                        weapon.displayName,
                                        style: TextStyle(
                                          color: HexColor('#FFFBF5')
                                              .withOpacity(0.7),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 60,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(child: Text('error'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
