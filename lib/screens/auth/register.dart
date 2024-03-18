import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_button/custom_filled_button.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_card/custom_card.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_divider/custom_divider.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_drop_down/custom_drop_down.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_textfromfield/custom_textformfield.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterHelper _registerHelper = Get.put(RegisterHelper());

  @override
  Widget build(BuildContext context) {
    _registerHelper.getDataProvinces(); // coba liat getx on init
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
// padding jadiin 1
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
// cari cari simplified biar nda banyak baris
                        CustomCardWithHeader(
                            header: "Autentikasi",
                            fontsize: 18.0,
                            fontweight: FontWeight.bold,
                            divider: const CustomDivider(
                              space: 20.0,
                            ),
                            children: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
// onSave ?
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
                            fontsize: 18.0,
                            fontweight: FontWeight.bold,
                            divider: const CustomDivider(
                              space: 20.0,
                            ),
                            children: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
//onSave
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
//onSave
                                      const Gap(10.0),
                                      Obx(
                                        () => FutureBuilder(
                                            future: _registerHelper
                                                .getDataProvinces(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return CustomDropDown(
                                                  list: snapshot.data as List,
                                                  label: "Provinsi",
                                                  verification: _registerHelper
                                                      .provinsiVerification
                                                      .value,
// kalau misalnya errortext sama bisa di simplified make function
                                                  errorText: !_registerHelper
                                                          .provinsiVerification
                                                          .value
                                                      ? ''
                                                      : null,
                                                  onSelected: (value) =>
                                                      _registerHelper
                                                          .regenciesValue
                                                          .value = value!,
                                                );
                                              } else {
                                                // circular di custom
                                                return const CircularProgressIndicator();
                                              }
                                            }),
                                      ),
                                      const Gap(10.0),
                                      Obx(
                                        () => FutureBuilder(
                                            future: _registerHelper
                                                .getDataRegencies(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return CustomDropDown(
                                                  list: snapshot.data as List,
                                                  label: "Kabupaten / Kota",
                                                  verification: _registerHelper
                                                      .provinsiVerification
                                                      .value,
                                                  errorText: !_registerHelper
                                                          .provinsiVerification
                                                          .value
                                                      ? ''
                                                      : null,
                                                  onSelected: (value) =>
                                                      _registerHelper
                                                          .districtsValue
                                                          .value = value!,
                                                );
                                              } else {
                                                return CustomDropDown(
                                                    list: const [],
                                                    label: "Kabupaten / Kota",
                                                    verification: _registerHelper
                                                        .kecamatanVerification
                                                        .isTrue,
                                                    errorText: "");
                                              }
                                            }),
                                      ),
                                      const Gap(10.0),
                                      Obx(
                                        () => FutureBuilder(
                                            future: _registerHelper
                                                .getDataDistrict(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return CustomDropDown(
                                                  list: snapshot.data as List,
                                                  label: "Kecamatan",
                                                  verification: _registerHelper
                                                      .provinsiVerification
                                                      .value,
                                                  errorText: !_registerHelper
                                                          .provinsiVerification
                                                          .value
                                                      ? ''
                                                      : null,
                                                  onSelected: (value) =>
                                                      _registerHelper
                                                          .villagesValue
                                                          .value = value!,
                                                );
                                              } else {
                                                return CustomDropDown(
                                                  list: const [],
                                                  label: "Kecamatan",
                                                  verification: _registerHelper
                                                      .kecamatanVerification
                                                      .isTrue,
                                                  errorText: "",
                                                );
                                              }
                                            }),
                                      ),
                                      const Gap(10.0),
                                      Obx(
                                        () => FutureBuilder(
                                            future: _registerHelper
                                                .getDataVillage(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return CustomDropDown(
                                                  list: snapshot.data as List,
                                                  label: "Kelurahan / Desa",
                                                  verification: _registerHelper
                                                      .provinsiVerification
                                                      .value,
                                                  errorText: !_registerHelper
                                                          .provinsiVerification
                                                          .value
                                                      ? ''
                                                      : null,
                                                );
                                              } else {
                                                return CustomDropDown(
                                                    list: const [],
                                                    label: "Kelurahan / Desa",
                                                    verification: _registerHelper
                                                        .kecamatanVerification
                                                        .isTrue,
                                                    errorText: "");
                                              }
                                            }),
                                      ),
                                    ],
                                  ),
                                  const Gap(10.0),
                                  Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Gap(10.0),
                                        CustomTextFormField(
                                          label: "RT",
                                          verification: _registerHelper
                                              .rtVerification.value,
                                        ),
                                        const Gap(10.0),
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
                        child: CustomFilledButton(
                          label: "Submit",
                          onPressed: () {},
                        ),
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
