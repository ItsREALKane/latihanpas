import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihanpas/app/controllers/loginController.dart';
import 'package:latihanpas/screen/RegisterPage.dart';
import 'package:latihanpas/widgets/myTextField.dart';
import 'package:latihanpas/widgets/btnLogin.dart';

class LoginPage extends StatelessWidget {
  final ApiloginControllerr apiloginControllerr =Get.put(ApiloginControllerr());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  'Login',
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
                SizedBox(height: 24),
                BtnLogin(
                  text: 'Login',
                  onPressed: () {
                    if (usernameController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      apiloginControllerr.loginStatus.value =
                          'Isi username dan password terlebih dahulu';
                    } else {
                      apiloginControllerr.loginUser(
                        usernameController.text,
                        passwordController.text,
                      );
                    }
                  },
                ),
                SizedBox(height: 16),
                Obx(() => Text(
                  apiloginControllerr.loginStatus.value,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                )),
                TextButton(
                  onPressed: () {
                    Get.to(() => RegisterPage());
                  },
                  child: Text(
                    'Belum punya akun? Register disini',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
