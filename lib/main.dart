import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_34/menu/favorite_menu.dart';
import 'package:pas1_mobile_11pplg2_34/page/responsive_layout.dart';
import 'api_login/login_page.dart';
import 'bindings/bindings.dart';
import 'controller/responsive_controller.dart';
import 'detail/detail_home_mobile.dart';
import 'detail/detail_home_tablet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveController controllers = Get.put(ResponsiveController());
    return GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        //list all page here
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/fav', page: () => FavoriteMenu()),
        GetPage(name: '/detailhomemobile', page: () => DetailHomeMobile()),
        GetPage(name: '/detailhometablet', page: () => DetailHomeTablet()),
        GetPage(name: '/dashboard', page: () => LayoutBuilder(builder: (context, constraints) {controllers.updateScreenWidth(constraints.maxWidth);return ResponsiveLayout();}), binding: MyBindings()),
      ],
    );
  }
}
