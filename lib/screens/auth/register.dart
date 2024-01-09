import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_textfromfield/custom_textformfield.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterHelper _registerHelper = Get.put(RegisterHelper());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final listRegister = _registerHelper.generateList();
        final verification = [];
        var constrained = BoxConstraints(
          maxWidth: constraint.maxWidth > 700 ? 700 : constraint.maxWidth * 0.8,
          minWidth: constraint.maxWidth > 700 ? 700 : constraint.maxWidth * 0.8,
        );
        var constrainedV2 = BoxConstraints(
          maxWidth: constraint.maxWidth <= 700
              ? (constraint.maxWidth - 100) / 2
              : (constraint.maxWidth - 200) / 4,
        );
        var constrainedV3 = BoxConstraints(
          maxWidth: constraint.maxWidth <= 700
              ? (constraint.maxWidth - 100) / 3
              : (constraint.maxWidth - 200) / 6,
        );
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(),
              child: Obx(
                () => CustomTextFromField(
                  listLabel: listRegister["label"],
                  type: listRegister["type"],
                  lengthList: listRegister['length'],
                  constraints: constrainedV2,
                  verification: listRegister["verification"].isEmpty,
                  errorText: listRegister["error_text"],
                  listController: listRegister["controller"],
                  breakpoint: listRegister["breakpoint"],
                  breakpointTitle: listRegister["breakpoint_title"],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
