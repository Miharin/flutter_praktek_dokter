import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/auth_helper.dart';
import 'package:flutter_praktek_dokter/screens/auth/auth_screen.dart';
import 'package:flutter_praktek_dokter/screens/auth/login.dart';
import 'package:flutter_praktek_dokter/screens/auth/register.dart';
import 'package:flutter_praktek_dokter/widget/custom_button/custom_filled_button.dart';
import 'package:get/get.dart';

final AuthHelper _isUserLogin = Get.put(AuthHelper());

class Routes {
  List<GetPage<dynamic>> routes = [
    GetPage(
        name: '/',
        page: () {
          return StreamBuilder(
              stream: _isUserLogin.checkAuthState(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.hasData) {
                    _isUserLogin.userIsLogin.value = true;
                  } else {
                    _isUserLogin.userIsLogin.value = false;
                  }
                  return Obx(
                    () => AnimatedCrossFade(
                      firstChild: AuthScreen(
                        title: "Login Screen",
                        child: LoginScreen(),
                      ),
                      secondChild: SizedBox.shrink(
                        child: AuthScreen(
                          title: "Dashboard Screen",
                          child: Center(
                            child: CustomFilledButton(
                              label: "Logout",
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                _isUserLogin.userIsLogin.value = false;
                              },
                            ),
                          ),
                        ),
                      ),
                      crossFadeState: _isUserLogin.userIsLogin.value
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 1000),
                    ),
                  );
                }
              });
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
