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
      return Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: constraint.maxWidth > 500
                            ? 500
                            : constraint.maxWidth * 0.8),
                    child: const Divider(
                      indent: 3.0,
                      endIndent: 3.0,
                    ),
                  ),
                  const Gap(5.0),
                  Obx(
                    () => CustomTextField(
                      controller: _authController.emailController,
                      label: "Email",
                      onChanged: (value) => _authController.setAuth(
                        'email',
                        _authController.emailController.text,
                        _authController.emailController.text.isEmail,
                      ),
                      verification: _authController.emailVerification.value,
                      errorText: "Format Email Tidak Sesuai",
                      constraints: BoxConstraints(
                          maxWidth: constraint.maxWidth > 500
                              ? 500
                              : constraint.maxWidth * 0.8),
                      icon: Icons.email_rounded,
                    ),
                  ),
                  const Gap(10.0),
                  Obx(
                    () => CustomTextField(
                      controller: _authController.passwordController,
                      label: "Password",
                      onChanged: (value) => _authController.setAuth(
                        'password',
                        _authController.passwordController.text,
                        _authController.passwordController.text.isNotEmpty &&
                            _authController.passwordController.text.length >= 8,
                      ),
                      verification: _authController.passwordVerification.value,
                      errorText:
                          "Password Harus Memiliki Panjang Minimal 8 Karakter atau Numerik",
                      icon: Icons.lock_rounded,
                      obscureText: true,
                      constraints: BoxConstraints(
                          maxWidth: constraint.maxWidth > 500
                              ? 500
                              : constraint.maxWidth * 0.8),
                    ),
                  ),
                  const Gap(10.0),
                  Obx(
                    () => CustomFilledButton(
                      label: "Login",
                      icon: const Icon(Icons.login_rounded),
                      width: constraint.maxWidth > 500.0
                          ? const Size(500.0, 50.0)
                          : Size(constraint.maxWidth * 0.8, 40.0),
                      onPressed: _authController.disabledLoginButton.value
                          ? null
                          : () {
                              return CustomDialog(
                                onChanged: (value) => _authController.setAuth(
                                  'token',
                                  value,
                                  value.length >= 10,
                                ),
                              );
                            },
                    ),
                  )
                ]),
          ),
        ),
      );
    });
  }
}
