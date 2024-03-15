import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_button/custom__text_button.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_card/custom_card.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_divider/custom_dialog/custom_dialog.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_divider/custom_divider.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_text/custom_text.dart';
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
                  label: _authController.tokenList[0].label,
                  icon: _authController.tokenList[0].icon,
                  suffixIcon: IconButton(
                    icon: Icon(_authController.showToken.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () => _authController.showTokenToggle(),
                  ),
                  obscureText: _authController.showToken.value ? false : true,
                  onSave: (value) {
                    if (value!.isNotEmpty && value.length >= 10) {
                      _authController.tokenList[0].verification.value = true;
                    } else {
                      _authController.tokenList[0].verification.value = false;
                    }
                  },
                  // controller: _authController.tokenList[0].controller,
                  verification: _authController.tokenList[0].verification.value,
                  errorMessage: _authController.tokenList[0].errorMessage,
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
              onPressed: _authController.tokenList[0].verification.value
                  ? () {
                      _authController.signIn();
                      Get.back();
                    }
                  : null,
              child: const Text("Login"),
            ),
          ),
        ],
      );

      // Return
      return Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: constrained,
            child: FlatCard(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Header
                    const Header(child: "Login"),
                    const Gap(10.0),

                    // Email and Password Text Field with Map
                    // textFields,
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        CustomTextFormField(
                          label: "Email",
                          verification: false,
                          validator: (value) {
                            if (value!.isNotEmpty && !value.isEmail) {
                              return "Email Tidak Sesuai Format";
                            }
                          },
                        ),
                        CustomTextFormField(
                          label: "Password",
                          focusNode: _authController.focusPassword,
                          verification: false,
                          validator: (value) {
                            if (value!.isNotEmpty && value.length < 8) {
                              return "Password Wajib Diisi dan Minimal Terdiri dari 8 Digit";
                            }
                          },
                        ),
                      ]
                          // List.generate(_authController.loginList.length,
                          //     (index) {
                          //   bool isPassword =
                          //       _authController.loginList[index].id == "password";
                          //   return Obx(
                          //     () => CustomTextFormField(
                          //       label: _authController.loginList[index].label,
                          //       // icon: _authController.loginList[index].icon,
                          //       // controller:
                          //       //     _authController.loginList[index].controller,
                          //       verification: _authController
                          //           .loginList[index].verification.value,
                          //       obscureText:
                          //           _authController.loginList[index].obscureText,
                          //       suffixIcon: isPassword
                          //           ? IconButton(
                          //               icon: Icon(
                          //                 color: Colors.grey[400],
                          //                 !_authController
                          //                         .loginList[index].obscureText
                          //                     ? Icons.visibility_off
                          //                     : Icons.visibility,
                          //               ),
                          //               onPressed: () {
                          //                 _authController.toggleObscure(
                          //                     _authController.loginList[index]);
                          //               },
                          //             )
                          //           : null,
                          //       errorMessage:
                          //           _authController.loginList[index].errorMessage,
                          //       onSave: (value) {
                          //         if (!isPassword) {
                          //           if (value!.isEmail) {
                          //             _authController.loginList[index].verification
                          //                 .value = true;
                          //           } else {
                          //             _authController.loginList[index].verification
                          //                 .value = false;
                          //           }
                          //         } else {
                          //           if (value!.length >= 8) {
                          //             _authController.loginList[index].verification
                          //                 .value = true;
                          //           } else {
                          //             _authController.loginList[index].verification
                          //                 .value = false;
                          //           }
                          //         }
                          //         List checkVerification = List.generate(
                          //           _authController.loginList.length,
                          //           (index) => _authController
                          //               .loginList[index].verification.value,
                          //         );
                          //         if (checkVerification
                          //             .every((element) => element)) {
                          //           _authController.disabledLoginButton.value =
                          //               false;
                          //         } else {
                          //           _authController.disabledLoginButton.value =
                          //               true;
                          //         }
                          //       },
                          //     ),
                          //   );
                          // }).toList(),
                          ),
                    ),
                    const Gap(10.0),

                    // Button to Input Token
                    Flexible(
                      child: Obx(
                        () => CustomFilledButton(
                          label: "Log In",
                          // icon: const Icon(Icons.login_rounded),
                          onPressed: _authController.disabledLoginButton.value
                              ? null
                              : () => Get.dialog(customDialog),
                        ),
                      ),
                    ),
                    const Gap(5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomFlatTextButton(
                          onPressed: () {},
                          child: const Text("Lupa Password"),
                        ),
                        const CustomVerticalDivider(
                          height: 20.0,
                        ),
                        CustomFlatTextButton(
                          onPressed: () {},
                          child: const Text("Daftar Akun"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
