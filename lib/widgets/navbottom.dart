import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:latihanpas/app/controllers/navbotController.dart';
import 'package:latihanpas/screen/HomeScreen.dart';
import 'package:latihanpas/screen/favScreen.dart';
import 'package:latihanpas/screen/profileScreen.dart';

class NavBottom extends StatelessWidget {
  const NavBottom({super.key});

  @override
  Widget build(BuildContext context) {

    final NavBotController navbotController = Get.put(NavBotController());
    final List<Widget> menus = [HomePage(), FavoriteScreen(), ProfileScreen()];
    
    return Obx(() {
      return Scaffold(
        body: menus[navbotController.selectedIndex.value],
        bottomNavigationBar: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            selectedIndex: navbotController.selectedIndex.value,
            onTabChange: (index) {
              navbotController.changeMenu(index);
            },
            gap: 5,
            backgroundColor: Colors.black,
            color: Colors.grey.shade500,
            activeColor: Colors.white,
            haptic: true,
            duration: const Duration(milliseconds: 300),
            tabActiveBorder: Border.all(color: Colors.cyan.shade300),
            tabBorderRadius: 35,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.favorite, text: 'Favorite'), 
              GButton(icon: Icons.person, text: 'Profile'),
            ],
          ),
        ),
      );
    });
  }
}
