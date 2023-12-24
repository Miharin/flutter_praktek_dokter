import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_dialog/custom_dialog.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:flutter_praktek_dokter/helpers/auth/auth_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_button/custom_filled_button.dart';
import 'package:flutter_praktek_dokter/widget/custom_text_field/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Card(
      child: Column(
        children: [
          Text("Register"),
        ],
      ),
    ));
  }
}
