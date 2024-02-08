import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant/app/constant/color.dart';
import 'package:valorant/app/modules/agent/controllers/agent_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();

  // ....
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final valorantC = Get.put(AgentController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: valorantC.fetchDataValorantAgents(),
      builder: (context, snapshot) {
        // waiting for content
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: primaryColor,
              body: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'VALORANT',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Center(
                      child: Text(
                        'valorant app\nv.1.0',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }

        if (snapshot.hasData) {
          return GetMaterialApp(
            title: "valorant app",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: false, fontFamily: 'Valorant'),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        }

        return Container();
      },
    );
  }
}
