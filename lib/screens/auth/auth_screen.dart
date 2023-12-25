import 'package:flutter/material.dart';

import 'package:flutter_praktek_dokter/widget/custom_appbar/custom_appbar.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key, required this.child, required this.title});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: title,
        actions: [
          IconButton(
            icon: title == "Login Screen"
                ? const Icon(Icons.person_add_rounded)
                : const Icon(Icons.login_rounded),
            onPressed: () {
              title == "Login Screen"
                  ? Get.offNamed('/register')
                  : Get.offNamed('/');
            },
            tooltip: title == "Login Screen" ? "Register" : "Login",
            hoverColor: Colors.white.withOpacity(0.5),
          ),
        ],
      ),
      body: child,
    );
  }
}
