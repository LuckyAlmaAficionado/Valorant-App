import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:valorant/app/models/weapons.dart';
import 'package:valorant/app/routes/app_pages.dart';

import '../controllers/detail_weapon_controller.dart';

class DetailWeaponView extends GetView<DetailWeaponController> {
  const DetailWeaponView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DetailWeaponController()).initWeapon(Get.arguments['weapon']);
    return Scaffold(
      backgroundColor: HexColor('#FD4556'),
      appBar: AppBar(
        title: Text(controller.weapon.value!.displayName),
        centerTitle: true,
        backgroundColor: HexColor('#FD4556'),
      ),
      body: SlidingUpPanel(
        maxHeight: Get.height * 0.8,
        minHeight: Get.height * 0.58,
        isDraggable: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        header: Container(
            margin: const EdgeInsets.only(top: 10),
            width: Get.width,
            height: 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 160),
              child: Material(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black38,
              ),
            )),
        panel: Container(
          width: Get.width,
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInfoDetailWeapon(
                      title: 'Weapon Type',
                      subTitle:
                          '${controller.weapon.value!.category.split(':').last}'),
                  CustomInfoDetailWeapon(
                    title: 'Fire Rate',
                    subTitle:
                        '${controller.weapon.value!.weaponStats!.fireRate}',
                  ),
                  CustomInfoDetailWeapon(
                    title: 'Reload Speed',
                    subTitle:
                        '${controller.weapon.value!.weaponStats!.reloadTimeSeconds}',
                  ),
                ],
              ),
              const Gap(20),
              Text(
                'Skins',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Gap(20),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.weapon.value!.skins!.length,
                    itemBuilder: (context, index) {
                      Skin skin = controller.weapon.value!.skins![index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: Get.width,
                        height: 160,
                        decoration: BoxDecoration(
                          color: HexColor('#FD4556'),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) => GestureDetector(
                            onTap: () {
                              (skin.levels[0].streamedVideo == null)
                                  ? Get.snackbar(
                                      '',
                                      "",
                                      titleText: Text(
                                        'Video Not Available',
                                        style: GoogleFonts.outfit(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      messageText: Text(
                                        'Sorry video not available!',
                                        style: GoogleFonts.outfit(),
                                      ),
                                    )
                                  : Get.toNamed(
                                      Routes.VIDEO,
                                      arguments: skin.levels[0].streamedVideo,
                                      preventDuplicates: false,
                                    );
                            },
                            child: Column(
                              children: [
                                (skin.displayIcon != null)
                                    ? Container(
                                        padding: const EdgeInsets.all(10),
                                        height: constraints.maxHeight,
                                        child: Image.network(
                                          skin.displayIcon!,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Icon(Icons.error_outline),
                                        ),
                                      )
                                    : SizedBox(
                                        height: constraints.maxHeight,
                                        child: Center(
                                          child: Text(
                                            'Tidak Ada Gambar',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        body: Container(
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [
                Container(
                  height: Get.height * 0.32,
                  width: Get.width,
                  child: Image.network(
                    controller.weapon.value!.displayIcon,
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${controller.weapon.value!.category.split(":").last.toUpperCase()}",
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Cost: ${controller.weapon.value?.shopData!.cost}",
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 190,
                  left: 30,
                  child: Text(
                    controller.weapon.value!.displayName,
                    style: TextStyle(
                      color: HexColor('#FFFBF5').withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class CustomInfoDetailWeapon extends StatelessWidget {
  const CustomInfoDetailWeapon({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.w600,
              color: HexColor('#FD4556'),
              fontSize: 20,
            ),
          ),
          const Gap(10),
          Text(
            subTitle,
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
