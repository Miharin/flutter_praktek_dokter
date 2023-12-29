import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/auth_helper.dart';
import 'package:flutter_praktek_dokter/screens/auth/auth_screen.dart';
import 'package:flutter_praktek_dokter/screens/auth/login.dart';
import 'package:flutter_praktek_dokter/screens/auth/register.dart';
import 'package:get/get.dart';

final AuthHelper _isUserLogin = Get.put(AuthHelper());

class Routes {
  List<GetPage<dynamic>> routes = [
    GetPage(
        name: '/',
        page: () {
          return AuthScreen(
            title: 'Login Screen',
            child: Obx(() => _isUserLogin.userIsLogin.value
                ? TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      _isUserLogin.userIsLogin.value = false;
                    },
                    child: const Text("Logout"),
                  )
                : LoginScreen()),
          );
        }),
    GetPage(
      name: '/register',
      page: () => AuthScreen(
        title: 'Register Screen',
        child: RegisterScreen(),
      ),
    ),
  ];
}
