import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant/app/constant/color.dart';
import 'package:valorant/app/routes/app_pages.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Valorant dashboard',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          const Gap(10),
        ],
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Get.toNamed(Routes.AGENT),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                width: Get.width,
                height: Get.height * 0.24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.black54),
                  gradient: LinearGradient(colors: [
                    primaryColor,
                    secondaryColor,
                  ]),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/valorant_agent.jpg',
                    ),
                    opacity: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(' Agent',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Valorant',
                        color: Colors.white,
                        fontSize: 30,
                      )),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.MAPS),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                width: Get.width,
                height: Get.height * 0.24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.black54),
                  gradient: LinearGradient(colors: [
                    primaryColor,
                    secondaryColor,
                  ]),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/valorant_maps.jpg',
                    ),
                    opacity: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text('Maps',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Valorant',
                        color: Colors.white,
                        fontSize: 30,
                      )),
                ),
              ),
            ),
            const Gap(16.0),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.WEAPONS),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                width: Get.width,
                height: Get.height * 0.24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.black54),
                  gradient: LinearGradient(colors: [
                    primaryColor,
                    secondaryColor,
                  ]),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/valorant_weapons.jpg',
                    ),
                    opacity: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text('Weapons',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Valorant',
                        color: Colors.white,
                        fontSize: 30,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NavBarDashboard extends StatelessWidget {
  const NavBarDashboard({
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Valorant Dashboard',
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
