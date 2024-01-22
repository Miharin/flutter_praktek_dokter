import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_button/custom_filled_button.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_card/custom_card.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_divider/custom_divider.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_expansion_panel/custom_expansion_panel.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_textfromfield/custom_textformfield.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterHelper _registerHelper = Get.put(RegisterHelper());

  @override
  Widget build(BuildContext context) {
    final List _panelItems = _registerHelper.generetePanelItems();
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
                        runSpacing: 10.0,
                        children: [
                          CustomCardWithHeader(
                            header: "Autentikasi",
                            fontzise: 18.0,
                            fontweight: FontWeight.bold,
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
                            header: "Identity",
                            fontzise: 18.0,
                            fontweight: FontWeight.bold,
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
                          CustomExpandableWidget(
                            expansionCallback: (int index, bool isExpanded) {
                              _registerHelper.togglePanel(index, _panelItems);
                            },
                            children: List.generate(
                              _panelItems.length,
                              (index) => ExpansionPanel(
                                headerBuilder: ((context, isExpanded) =>
                                    ListTile(
                                      title: Text(_panelItems[index].title),
                                    )),
                                body: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: _panelItems[index].body,
                                ),
                                isExpanded: _panelItems[index].isExpanded,
                                canTapOnHeader: true,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Gap(8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomFilledButton(label: "Submit"),
                        TextButton(
                          onPressed: () {
                            print(_registerHelper.registerList[5].controller);
                          },
                          child: const Text("Cancel"),
                        ),
                      ],
                    ),
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
