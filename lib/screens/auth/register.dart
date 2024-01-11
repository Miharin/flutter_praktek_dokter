import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_button/custom_filled_button.dart';
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

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => CustomTextFromField(
                        listLabel: listRegister["label"],
                        type: listRegister["type"],
                        lengthList: listRegister['length'],
                        verification: listRegister["verification"].isEmpty,
                        valueList: listRegister["value"],
                        errorText: listRegister["error_text"],
                        listController: listRegister["controller"],
                        breakpoint: listRegister["breakpoint"],
                        breakpointTitle: listRegister["breakpoint_title"],
                        listIcon: listRegister["icons"],
                        showIcon: listRegister["show-icons"],
                      ),
                    ),
                    const Gap(8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const CustomFilledButton(label: "Submit"),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Cancel"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
