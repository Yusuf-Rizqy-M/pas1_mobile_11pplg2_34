import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dashboard_controllers.dart';
import '../menu/favorite_menu.dart';
import '../menu/home_menu_mobile.dart';
import '../menu/profile_menu.dart';



class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardControllers dashboardControllers = Get.find();
    final List<Widget> menus = [HomeMenuMobile(),FavoriteMenu(), ProfileMenu()];

    return Obx(() {
      return Scaffold(
        body: menus[dashboardControllers.selectedindex.value],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blueAccent,
          currentIndex: dashboardControllers.selectedindex.value,
          onTap: dashboardControllers.changeMenu,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),

      );
    });
  }
}
