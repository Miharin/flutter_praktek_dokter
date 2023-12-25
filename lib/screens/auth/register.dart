import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_praktek_dokter/widget/custom_text_field/custom_text_field.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const StepperRegister();
  }
}

class StepperRegister extends StatefulWidget {
  const StepperRegister({super.key});

  @override
  State<StepperRegister> createState() => _Stepper();
}

final RegisterHelper _registerHelper = Get.put(RegisterHelper());

class _Stepper extends State<StepperRegister> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    var steps = [
      Step(
        title: const Text("DataDiri"),
        content: LayoutBuilder(builder: (context, constraints) {
          var constrained = BoxConstraints(
              maxWidth:
                  constraints.maxWidth > 500 ? 500 : constraints.maxWidth * 0.8,
              minWidth: constraints.maxWidth > 500
                  ? 500
                  : constraints.maxWidth * 0.8);

          return Card(
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
                          label: "NIK(Nomer Induk Kependukukan)",
                          constraints: constrained,
                          onChanged: (value) {},
                          controller: _registerHelper.nikControler,
                          verification: _registerHelper.nikVerification.value,
                          errorText: "WajibDiIsi"),
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
                          label: "TanggalLahir",
                          constraints: constrained,
                          onChanged: (value) => {},
                          controller: _registerHelper.tanggallahirControler,
                          verification:
                              _registerHelper.tanggallairVerification.value,
                          errorText: "WajibDiIsi"),
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
                        verification: _registerHelper.agamaVerification.value,
                        errorText: "WajibDiIsi"),
                  ]),
                  const Gap(10.0),
                  Row(
                    children: [
                      CustomTextField(
                          label: "StatusPerkawinan",
                          constraints: constrained,
                          onChanged: (value) => {},
                          controller: _registerHelper.statusperkawinanControler,
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
                          controller: _registerHelper.kewarganegaraanControler,
                          verification:
                              _registerHelper.kewarganegaraanVerification.value,
                          errorText: "WajibDiIsi"),
                    ],
                  )
                ],
              ),
            ),
          );
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
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() => _index -= 1);
        }
      },
      onStepContinue: () {
        if (_index >= 0 && _index < steps.length - 1) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: steps,
    );
  }
}
