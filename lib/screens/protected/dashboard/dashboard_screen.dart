import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/auth_helper.dart';
import 'package:flutter_praktek_dokter/screens/protected/protected_screen.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_button/custom_filled_button.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final AuthHelper _isUserLogin = Get.put(AuthHelper());

  @override
  Widget build(BuildContext context) {
    return ProtectedScreen(
      title: "Dashboard Screen",
      child: Column(
        children: [
          CustomFilledButton(
            label: "Logout",
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              _isUserLogin.userIsLogin.value = false;
            },
          ),
        ],
      ),
    );
  }
}
