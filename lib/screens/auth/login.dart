import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_divider/custom_dialog/custom_dialog.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_textfromfield/custom_textformfield.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:flutter_praktek_dokter/helpers/auth/auth_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_button/custom_filled_button.dart';
// import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_text_field/custom_text_field.dart';

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

      // Custom Dialog
      var customDialog = CustomDialog(
        title: "Please Input Token !",
        content: ConstrainedBox(
          constraints: constrained,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => CustomTextFormField(
                  label: "Token",
                  icon: Icons.password,
                  suffixIcon: IconButton(
                    icon: Icon(_authController.showToken.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () => _authController.showTokenToggle(),
                  ),
                  obscureText: _authController.showToken.value ? false : true,
                  onSave: (value) => _authController.setAuth(
                    'token',
                    _authController.tokenController.text,
                    _authController.tokenController.text.isNotEmpty &&
                        _authController.tokenController.text.length >= 10,
                  ),
                  controller: _authController.tokenController,
                  verification: _authController.tokenVerification.value,
                  errorMessage:
                      "Token Harus Memiliki Panjang Minimal 10 Karakter atau Numerik",
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel"),
          ),
          Obx(
            () => TextButton(
              onPressed: _authController.disabledTokenButton.value
                  ? null
                  : () {
                      _authController.signIn();
                      Get.back();
                    },
              child: const Text("Login"),
            ),
          ),
        ],
      );

      // Return
      return Center(
        child: ConstrainedBox(
          constraints: constrained,
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
                  // textFields,
                  Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(_authController.loginList.length,
                          (index) {
                        bool isPassword =
                            _authController.loginList[index].id == "password";
                        return CustomTextFormField(
                          label: _authController.loginList[index].label,
                          icon: _authController.loginList[index].icon,
                          controller:
                              _authController.loginList[index].controller,
                          verification: _authController
                              .loginList[index].verification.value,
                          obscureText:
                              _authController.loginList[index].obscureText,
                          suffixIcon: isPassword
                              ? IconButton(
                                  icon: Icon(_authController.showPassword.value
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () =>
                                      _authController.showPasswordToggle(),
                                )
                              : null,
                          errorMessage:
                              _authController.loginList[index].errorMessage,
                          onSave: (value) {
                            if (!isPassword) {
                              if (value!.isEmail) {
                                _authController
                                    .loginList[index].verification.value = true;
                              } else {
                                _authController.loginList[index].verification
                                    .value = false;
                              }
                            } else {
                              if (value!.length >= 8) {
                                _authController
                                    .loginList[index].verification.value = true;
                              } else {
                                _authController.loginList[index].verification
                                    .value = false;
                              }
                            }
                            List checkVerification = List.generate(
                              _authController.loginList.length,
                              (index) => _authController
                                  .loginList[index].verification.value,
                            );
                            if (checkVerification.every((element) => element)) {
                              _authController.disabledLoginButton.value = false;
                            } else {
                              _authController.disabledLoginButton.value = true;
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const Gap(10.0),

                  // Button to Input Token
                  Flexible(
                    child: Obx(
                      () => CustomFilledButton(
                        label: "Login",
                        icon: const Icon(Icons.login_rounded),
                        onPressed: _authController.disabledLoginButton.value
                            ? null
                            : () => Get.dialog(customDialog),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
