import 'package:drink_water_reminded/features/cups_screen/view/cups_screen.dart';
import 'package:drink_water_reminded/features/drink_water_screen/view/drink_water_screen.dart';
import 'package:drink_water_reminded/features/statistic_dink/view/statistic_screen.dart';
import 'package:drink_water_reminded/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../controllers/home_controller.dart';

class WaterHomeScreen extends StatelessWidget {
  const WaterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navScreens = [
      const CupsAddScreen(),
      const DrinkWaterScreen(),
      const StatisticScreen(),
    ];
    return Obx(
      () => Scaffold(
        bottomNavigationBar: GNav(
            backgroundColor: Colors.white,
            color: Colors.blueGrey,
            activeColor: Colors.lightBlue,
            gap: 8,
            onTabChange: (value) {
              controller.currentNavIndex.value = value;
            },
            tabs: [
              GButton(
                icon: Icons.free_breakfast,
                text: S.of(context).cups,
              ),
              GButton(
                icon: Icons.water,
                text: S.of(context).hidration,
              ),
              GButton(
                icon: Icons.timeline,
                text: S.of(context).timeline,
              )
            ]),
        body: Column(
          children: [
            Expanded(
              child: navScreens.elementAt(controller.currentNavIndex.value),
            )
          ],
        ),
      ),
    );
  }
}
