import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_drop_down/custom_drop_down.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_textfromfield/custom_textformfield.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _registerHelper = Get.find<RegisterHelper>();

  @override
  Widget build(BuildContext context) {
    _registerHelper.getDataProvinces(); // coba liat getx on init
    return LayoutBuilder(
      builder: (context, constraint) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stepper(
            currentStep: 2,
            steps: <Step>[
              Step(
                title: const Text("Autentikasi"),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // onSave ?
                      CustomTextFormField(
                        label: "NIK",
                        verification:
                            _registerHelper.registerVerification["nik"]!,
                      ),
                      CustomTextFormField(
                        label: "Email",
                        verification:
                            _registerHelper.registerVerification["email"]!,
                      ),
                      CustomTextFormField(
                        label: "Password",
                        verification:
                            _registerHelper.registerVerification["password"]!,
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                title: const Text("Identitas"),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //onSave
                      CustomTextFormField(
                        label: "Nama",
                        verification:
                            _registerHelper.registerVerification["name"]!,
                      ),
                      CustomTextFormField(
                        label: "Tempat Lahir",
                        verification:
                            _registerHelper.registerVerification["birthPlace"]!,
                      ),
                      CustomTextFormField(
                        label: "Tanggal Lahir",
                        keyboardType: TextInputType.datetime,
                        verification:
                            _registerHelper.registerVerification["birthDate"]!,
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                title: const Text("Identitas Pelengkap"),
                content: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Wrap(
                    runSpacing: 10.0,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //onSave
                          FutureBuilder(
                              future: _registerHelper.getDataProvinces(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return CustomDropDown(
                                    list: snapshot.data as List,
                                    label: "Provinsi",
                                    verification: _registerHelper
                                        .registerVerification["province"]!,
                                    // kalau misalnya errortext sama bisa di
                                    // simplified make function
                                    errorText: !_registerHelper
                                            .provinsiVerification.value
                                        ? ''
                                        : null,
                                    onSelected: (value) => _registerHelper
                                        .regenciesValue.value = value!,
                                  );
                                } else {
                                  // circular di custom
                                  return const CircularProgressIndicator();
                                }
                              }),
                          const Gap(10.0),
                          Obx(
                            () => FutureBuilder(
                                future: _registerHelper.getDataRegencies(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return CustomDropDown(
                                      list: snapshot.data as List,
                                      label: "Kabupaten / Kota",
                                      verification: _registerHelper
                                          .registerVerification["regency"]!,
                                      errorText: !_registerHelper
                                              .provinsiVerification.value
                                          ? ''
                                          : null,
                                      onSelected: (value) => _registerHelper
                                          .districtsValue.value = value!,
                                    );
                                  } else {
                                    return CustomDropDown(
                                        list: const [],
                                        label: "Kabupaten / Kota",
                                        verification: _registerHelper
                                            .registerVerification["regency"]!,
                                        errorText: "");
                                  }
                                }),
                          ),
                          const Gap(10.0),
                          Obx(
                            () => FutureBuilder(
                                future: _registerHelper.getDataDistrict(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return CustomDropDown(
                                      list: snapshot.data as List,
                                      label: "Kecamatan",
                                      verification: _registerHelper
                                          .registerVerification["district"]!,
                                      errorText: !_registerHelper
                                              .provinsiVerification.value
                                          ? ''
                                          : null,
                                      onSelected: (value) => _registerHelper
                                          .villagesValue.value = value!,
                                    );
                                  } else {
                                    return CustomDropDown(
                                      list: const [],
                                      label: "Kecamatan",
                                      verification: _registerHelper
                                          .registerVerification["district"]!,
                                      errorText: "",
                                    );
                                  }
                                }),
                          ),
                          const Gap(10.0),
                          Obx(
                            () => FutureBuilder(
                                future: _registerHelper.getDataVillage(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return CustomDropDown(
                                      list: snapshot.data as List,
                                      label: "Kelurahan / Desa",
                                      verification: _registerHelper
                                          .registerVerification["village"]!,
                                      errorText: !_registerHelper
                                              .provinsiVerification.value
                                          ? ''
                                          : null,
                                    );
                                  } else {
                                    return CustomDropDown(
                                      list: const [],
                                      label: "Kelurahan / Desa",
                                      verification: _registerHelper
                                          .registerVerification["village"]!,
                                      errorText: "",
                                    );
                                  }
                                }),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomTextFormField(
                            label: "RT",
                            verification:
                                _registerHelper.registerVerification["rt"]!,
                          ),
                          const Gap(10.0),
                          CustomTextFormField(
                            label: "RW",
                            verification:
                                _registerHelper.registerVerification["rw"]!,
                          ),
                          CustomTextFormField(
                            label: "Kode Pos",
                            verification: _registerHelper
                                .registerVerification["posCode"]!,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
