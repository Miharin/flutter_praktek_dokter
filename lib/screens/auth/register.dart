import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_button/custom_filled_button.dart';
import 'package:flutter_praktek_dokter/widget/custom_card/custom_card.dart';
import 'package:flutter_praktek_dokter/widget/custom_divider/custom_divider.dart';
import 'package:flutter_praktek_dokter/widget/custom_expansion_panel/custom_expansion_panel.dart';
import 'package:flutter_praktek_dokter/widget/custom_form/custom_form.dart';
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
                      () => CustomForm(
                        trigger: LogicalKeyboardKey.enter,
                        child: Wrap(
                          children: [
                            CustomCardWithHeader(
                              header: "Autentikasi",
                              children: Row(
                                children: [
                                  CustomTextFormField(
                                    label: label,
                                    controller: controller,
                                    verification: verification,
                                  )
                                ],
                              ),
                              divider: const CustomDivider(),
                            ),
                          ],
                        ),
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
