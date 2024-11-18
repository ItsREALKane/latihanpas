import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihanpas/app/adapter/logoutDialog.dart';
import 'package:latihanpas/widgets/btnCategory.dart';
import '../app/controllers/profileController.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        backgroundColor: const Color.fromARGB(255, 89, 33, 243),

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
             SizedBox(height: 20),
             CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
             SizedBox(height: 20),
            // Menggunakan Obx untuk reactive state
            Obx(() => Text(
              controller.username.value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(height: 10),
            Obx(() => Text(
              controller.email.value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            )),
            SizedBox(height: 30),
            BtnCategory(
              icon: Icons.person_outline,
              title: 'Edit Profile',
              onTap: () {
                Get.snackbar('Info', 'Edit Profile clicked');
              },
            ),
            BtnCategory(
              icon: Icons.lock_outline,
              title: 'Change Password',
              onTap: () {
                Get.snackbar('Info', 'Change Password clicked');
              },
            ),
            BtnCategory(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              onTap: () {
                Get.snackbar('Info', 'Notifications clicked');
              },
            ),
            BtnCategory(
              icon: Icons.security,
              title: 'Privacy and Security',
              onTap: () {
                Get.snackbar('Info', 'Privacy and Security clicked');
              },
            ),
            BtnCategory(
              icon: Icons.help_outline,
              title: 'Help Center',
              onTap: () {
                Get.snackbar('Info', 'Help Center clicked', );
              },
            ),
            BtnCategory(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                LogoutDialog(context, controller);
              },
            ),
          ],
        ),
      ),
    );
  }
}