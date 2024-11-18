import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihanpas/screen/loginPage.dart';
import 'package:latihanpas/screen/RegisterPage.dart';
import 'package:latihanpas/screen/splash.dart';
import 'package:latihanpas/screen/profileScreen.dart';
import 'package:latihanpas/widgets/navbottom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () =>  LoginPage()),
        GetPage(name: '/home', page: () => NavBottom()),
        GetPage(name: '/register', page: () =>  RegisterPage()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
      ],
    );
  }
}