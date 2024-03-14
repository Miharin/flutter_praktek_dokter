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
    _registerHelper.getDataFromAPI();
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                              children: [
                                CustomTextFormField(
                                  label: "NIK",
                                  verification:
                                      _registerHelper.nikVerification.value,
                                ),
                                CustomTextFormField(
                                  label: "Email",
                                  verification:
                                      _registerHelper.emailVerification.value,
                                ),
                                CustomTextFormField(
                                  label: "Password",
                                  verification: _registerHelper
                                      .passwordVerification.value,
                                ),
                              ],
                            )),
                        CustomCardWithHeader(
                            header: "Identity",
                            fontzise: 18.0,
                            fontweight: FontWeight.bold,
                            divider: const CustomDivider(
                              space: 20.0,
                            ),
                            children: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextFormField(
                                  label: "Nama",
                                  verification:
                                      _registerHelper.namaVerification.value,
                                ),
                                CustomTextFormField(
                                  label: "Tempat Lahir",
                                  verification: _registerHelper
                                      .tempatlahirVerification.value,
                                ),
                                CustomTextFormField(
                                  label: "Tanggal Lahir",
                                  verification: _registerHelper
                                      .taggallahirVerification.value,
                                ),
                              ],
                            )),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return ExpansionTile(
                                title: const Text("Identity Addon"),
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomTextFormField(
                                        label: "Provinsi",
                                        verification: _registerHelper
                                            .provinsiVerification.value,
                                      ),
                                      CustomTextFormField(
                                        label: "Kota / Kabupaten",
                                        verification: _registerHelper
                                            .kotaVerification.value,
                                      ),
                                      CustomTextFormField(
                                        label: "Kecamatan",
                                        verification: _registerHelper
                                            .kecamatanVerification.value,
                                      ),
                                    ],
                                  ),
                                  const Gap(10.0),
                                  Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomTextFormField(
                                          label: "Kelurahan / Desa",
                                          verification: _registerHelper
                                              .kelurahanVerification.value,
                                        ),
                                        CustomTextFormField(
                                          label: "RT",
                                          verification: _registerHelper
                                              .rtVerification.value,
                                        ),
                                        CustomTextFormField(
                                          label: "RW",
                                          verification: _registerHelper
                                              .rwVerification.value,
                                        ),
                                        CustomTextFormField(
                                          label: "Kode Pos",
                                          verification: _registerHelper
                                              .kodeposVerification.value,
                                        ),
                                      ]),
                                  const Gap(10.0),
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                  const Gap(8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: const CustomFilledButton(label: "Submit"),
                      ),
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
        );
      },
    );
  }
}
