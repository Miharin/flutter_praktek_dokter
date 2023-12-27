import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_praktek_dokter/widget/custom_text_field/custom_text_field.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterHelper _registerHelper = Get.put(RegisterHelper());

  @override
  Widget build(BuildContext context) {
    var steps = [
      Step(
        title: const Text("DataDiri"),
        content: LayoutBuilder(builder: (context, constraints) {
          var constrained = BoxConstraints(
            maxWidth:
                constraints.maxWidth > 500 ? 500 : constraints.maxWidth * 0.8,
            minWidth:
                constraints.maxWidth > 500 ? 500 : constraints.maxWidth * 0.8,
          );

          return Obx(() => Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextField(
                            label: "NIK",
                            constraints: constrained,
                            onChanged: (value) =>
                                _registerHelper.setRegisterData(
                              "NIK",
                              _registerHelper.nikControler.text,
                              _registerHelper.nikControler.text.length == 16,
                            ),
                            controller: _registerHelper.nikControler,
                            verification: _registerHelper.nikVerification.value,
                            errorText: "NIK harus Memiliki Panjang 16 Digit",
                            type: TextInputType.number,
                          ),
                          const Gap(10.0),
                          CustomTextField(
                              label: "TempatLahir",
                              constraints: constrained,
                              onChanged: (value) => {},
                              controller: _registerHelper.tempatlahirControler,
                              verification:
                                  _registerHelper.tempatlahirVerification.value,
                              errorText: "WajibDiIsi"),
                          const Gap(10.0),
                          CustomTextField(
                            label: "Tanggal Lahir",
                            constraints: constrained,
                            onChanged: (value) =>
                                _registerHelper.setRegisterData(
                              "TanggalLahir",
                              _registerHelper.tanggallahirControler.text,
                              _registerHelper
                                      .tanggallahirControler.text.length ==
                                  16,
                            ),
                            controller: _registerHelper.tanggallahirControler,
                            verification:
                                _registerHelper.tanggallairVerification.value,
                            errorText: "WajibDiIsi",
                            type: TextInputType.datetime,
                          ),
                        ],
                      ),
                      const Gap(10.0),
                      Row(children: [
                        CustomTextField(
                            label: "JenisKelamin",
                            constraints: constrained,
                            onChanged: (value) => {},
                            controller: _registerHelper.jeniskelaminControler,
                            verification:
                                _registerHelper.jeniskelaminVerification.value,
                            errorText: "WajibDiIsi"),
                        const Gap(10.0),
                        CustomTextField(
                            label: "GolonganDarah",
                            constraints: constrained,
                            onChanged: (value) => {},
                            controller: _registerHelper.golongandarahControler,
                            verification:
                                _registerHelper.golongandarahVerification.value,
                            errorText: "WajibDiIsi"),
                        const Gap(10.0),
                        CustomTextField(
                            label: "Agama",
                            constraints: constrained,
                            onChanged: (value) => {},
                            controller: _registerHelper.agamaControler,
                            verification:
                                _registerHelper.agamaVerification.value,
                            errorText: "WajibDiIsi"),
                      ]),
                      const Gap(10.0),
                      Row(
                        children: [
                          CustomTextField(
                              label: "StatusPerkawinan",
                              constraints: constrained,
                              onChanged: (value) => {},
                              controller:
                                  _registerHelper.statusperkawinanControler,
                              verification: _registerHelper
                                  .statusperkawinanVerification.value,
                              errorText: "WajibDiIsi"),
                          const Gap(10.0),
                          CustomTextField(
                              label: "Pekerjaan",
                              constraints: constrained,
                              onChanged: (value) => {},
                              controller: _registerHelper.pekerjaanControler,
                              verification:
                                  _registerHelper.pekerjaanVerification.value,
                              errorText: "WajibDiIsi"),
                          const Gap(10.0),
                          CustomTextField(
                              label: "Kewarganegaraan",
                              constraints: constrained,
                              onChanged: (value) => {},
                              controller:
                                  _registerHelper.kewarganegaraanControler,
                              verification: _registerHelper
                                  .kewarganegaraanVerification.value,
                              errorText: "WajibDiIsi"),
                        ],
                      )
                    ],
                  ),
                ),
              ));
        }),
      ),
      const Step(
        title: Text("xD"),
        content: TextField(
          decoration: InputDecoration(
            label: Text("2"),
          ),
        ),
      ),
      const Step(
        title: Text(":v"),
        content: TextField(
          decoration: InputDecoration(
            label: Text("3"),
          ),
        ),
      )
    ];
    return Obx(() => Stepper(
          currentStep: _registerHelper.index.value,
          onStepCancel: () =>
              _registerHelper.onStepCancel(_registerHelper.index.value),
          onStepContinue: () => _registerHelper.onStepContinue(steps.length),
          onStepTapped: (value) =>
              _registerHelper.onStepTapped(_registerHelper.index.value),
          steps: steps,
        ));
  }
}
