import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.title,
    required this.isBack,
  });

  // deklarasi title
  final String title;
  final bool isBack;

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
            (isBack)
                ? GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  )
                : SizedBox(),
            const Gap(10),
            Text(
              title,
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
