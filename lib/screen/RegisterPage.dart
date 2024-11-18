import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihanpas/app/controllers/registerController.dart';
import 'package:latihanpas/widgets/myTextField.dart';
import 'package:latihanpas/widgets/btnLogin.dart';

class RegisterPage extends StatelessWidget {

  final RegisterController postControllerr = Get.put(RegisterController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40),
                Image.asset('assets/premier.png', height: 100),
                SizedBox(height: 20),
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                CustomTextField(
                  controller: usernameController,
                  labelText: 'Username',
                  prefixIcon: Icons.person,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: fullNameController,
                  labelText: 'Full Name',
                  prefixIcon: Icons.badge,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: emailController,
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: 24),
                BtnLogin(
                  text: 'Register',
                  onPressed: () {
                    if (usernameController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        fullNameController.text.isEmpty ||
                        emailController.text.isEmpty) {
                      postControllerr.registerStatus.value = 'Isi semua field terlebih dahulu';
                    } else {
                      postControllerr.registerUser(
                        usernameController.text,
                        passwordController.text,
                        fullNameController.text,
                        emailController.text,
                      );
                    }
                  },
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Sudah punya akun? Login disini',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Obx(() => Text(
                  postControllerr.registerStatus.value,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
