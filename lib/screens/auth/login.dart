import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_dialog/custom_dialog.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:flutter_praktek_dokter/helpers/auth/auth_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_button/custom_filled_button.dart';
import 'package:flutter_praktek_dokter/widget/custom_text_field/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthHelper _authController = Get.put(AuthHelper());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      // Constrained For Text Field
      var constrained = BoxConstraints(
        maxWidth: constraint.maxWidth > 500 ? 500 : constraint.maxWidth * 0.8,
        minWidth: constraint.maxWidth > 500 ? 500 : constraint.maxWidth * 0.8,
      );

      // Constrained For Button
      var constrainedButton = constraint.maxWidth > 500.0
          ? const Size(500.0, 50.0)
          : Size(
              constraint.maxWidth * 0.8,
              40.0,
            );

      // Custom Dialog
      var customDialog = CustomDialog(
        title: "Please Input Token !",
        content: CustomTextField(
            label: "Token",
            constraints: constrained,
            obscureText: true,
            onChanged: (value) => _authController.setAuth(
                  'token',
                  _authController.tokenController.text,
                  _authController.tokenController.text.isNotEmpty &&
                      _authController.tokenController.text.length >= 10,
                ),
            controller: _authController.tokenController,
            verification: _authController.tokenVerification.value,
            errorText:
                "Token Harus Memiliki Panjang Minimal 10 Karakter atau Numerik"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _authController.signIn();
              Get.back();
            },
            child: const Text("Login"),
          ),
        ],
      );

      // All Text Fields
      var textFields = Obx(() => Column(
            children: [
              CustomTextField(
                controller: _authController.emailController,
                label: "Email",
                onChanged: (value) => _authController.setAuth(
                  'email',
                  _authController.emailController.text,
                  _authController.emailController.text.isEmail,
                ),
                verification: _authController.emailVerification.value,
                errorText: "Format Email Tidak Sesuai",
                constraints: constrained,
                icon: Icons.email_rounded,
              ),
              const Gap(10.0),
              CustomTextField(
                controller: _authController.passwordController,
                label: "Password",
                onChanged: (value) => _authController.setAuth(
                  'password',
                  _authController.passwordController.text,
                  _authController.passwordController.text.length > 8,
                ),
                verification: _authController.passwordVerification.value,
                errorText:
                    "Password Harus Memiliki Panjang Minimal 8 Karakter atau Numerik",
                constraints: constrained,
                icon: Icons.lock_rounded,
                obscureText: false,
              ),
            ],
          ));

      // Return
      return Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                // Text Field and Button with Constrained Box
                ConstrainedBox(
                  constraints: constrained,
                  child: const Divider(
                    indent: 3.0,
                    endIndent: 3.0,
                  ),
                ),
                const Gap(5.0),

                // Email and Password Text Field with Map
                textFields,
                const Gap(10.0),

                // Button to Input Token
                Obx(
                  () => CustomFilledButton(
                    label: "Login",
                    icon: const Icon(Icons.login_rounded),
                    width: constrainedButton,
                    onPressed: _authController.disabledLoginButton.value
                        ? null
                        : () => Get.dialog(customDialog),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
