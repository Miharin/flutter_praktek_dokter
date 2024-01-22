import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_button/custom_filled_button.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_card/custom_card.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_divider/custom_divider.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_textfromfield/custom_textformfield.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterHelper _registerHelper = Get.put(RegisterHelper());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
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
                      () => Wrap(
                        children: [
                          CustomCardWithHeader(
                            header: "Autentikasi",
                            divider: const CustomDivider(
                              space: 20.0,
                            ),
                            children: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                3,
                                (index) => CustomTextFormField(
                                  label: _registerHelper.registerList[index].id,
                                  controller: _registerHelper
                                      .registerList[index].controller,
                                  verification: _registerHelper
                                      .registerList[index].verification,
                                  keyboardType:
                                      _registerHelper.registerList[index].type,
                                ),
                              ).toList(),
                            ),
                          ),
                          CustomCardWithHeader(
                            header: "Autentikasi",
                            divider: const CustomDivider(
                              space: 20.0,
                            ),
                            children: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                3,
                                (index) {
                                  index = index + 3;
                                  return CustomTextFormField(
                                    label: _registerHelper
                                        .registerList[index].label,
                                    controller: _registerHelper
                                        .registerList[index].controller,
                                    verification: _registerHelper
                                        .registerList[index].verification,
                                    keyboardType: _registerHelper
                                        .registerList[index].type,
                                    onSave: (value) => print(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const CustomFilledButton(label: "Submit"),
                        TextButton(
                          onPressed: () {
                            print(_registerHelper.registerList[5].controller);
                          },
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
