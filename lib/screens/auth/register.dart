import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_button/custom__text_button.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_button/custom_filled_button.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_drop_down/custom_drop_down.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_form/custom_form.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_textfromfield/custom_textformfield.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _registerHelper = Get.find<RegisterHelper>();

  @override
  Widget build(BuildContext context) {
    _registerHelper.getDataProvinces(); // coba liat getx on init
    final steps = <Step>[
      Step(
        title: Obx(
          () => Row(
            children: [
              const Text("Authentication"),
              const Gap(5.0),
              Text(
                _registerHelper.helperText("authentication"),
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // onSave ?
              CustomTextFormField(
                label: "NIK",
                length: 16,
                verification: _registerHelper.registerVerification["nik"]!,
                onSave: (value) =>
                    _registerHelper.handleRegisterTextFormFieldChanged(
                  "nik",
                  value,
                ),
                validator: (value) => _registerHelper.validatorRegister(
                  "nik",
                  value,
                ),
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                label: "Email",
                verification: _registerHelper.registerVerification["email"]!,
                onSave: (value) =>
                    _registerHelper.handleRegisterTextFormFieldChanged(
                  "email",
                  value,
                ),
                validator: (value) => _registerHelper.validatorRegister(
                  "email",
                  value,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                label: "Password",
                verification: _registerHelper.registerVerification["password"]!,
                onSave: (value) =>
                    _registerHelper.handleRegisterTextFormFieldChanged(
                  "password",
                  value,
                ),
                validator: (value) => _registerHelper.validatorRegister(
                  "password",
                  value,
                ),
                keyboardType: TextInputType.text,
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
                verification: _registerHelper.registerVerification["name"]!,
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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //onSave
              FutureBuilder(
                  future: _registerHelper.getDataProvinces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CustomDropDown(
                        flex: 3,
                        list: snapshot.data as List,
                        label: "Provinsi",
                        verification:
                            _registerHelper.registerVerification["province"]!,
                        // kalau misalnya errortext sama bisa di
                        // simplified make function
                        onSelected: (value) =>
                            _registerHelper.regenciesValue.value = value!,
                      );
                    } else {
                      return CustomDropDown(
                        flex: 3,
                        list: const [],
                        enabled: false,
                        label: "Provinsi",
                        verification:
                            _registerHelper.registerVerification["province"]!,
                        errorText: "",
                      );
                    }
                  }),
              const Gap(10.0),
              Obx(
                () => FutureBuilder(
                    future: _registerHelper.getDataRegencies(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CustomDropDown(
                          flex: 3,
                          list: snapshot.data as List,
                          label: "Kabupaten / Kota",
                          verification:
                              _registerHelper.registerVerification["regency"]!,
                          onSelected: (value) =>
                              _registerHelper.districtsValue.value = value!,
                        );
                      } else {
                        return CustomDropDown(
                            flex: 3,
                            list: const [],
                            enabled: false,
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
                          flex: 3,
                          list: snapshot.data as List,
                          label: "Kecamatan",
                          verification:
                              _registerHelper.registerVerification["district"]!,
                          onSelected: (value) =>
                              _registerHelper.villagesValue.value = value!,
                        );
                      } else {
                        return CustomDropDown(
                          flex: 3,
                          list: const [],
                          label: "Kecamatan",
                          enabled: false,
                          verification:
                              _registerHelper.registerVerification["district"]!,
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
                          flex: 3,
                          list: snapshot.data as List,
                          label: "Kelurahan / Desa",
                          verification:
                              _registerHelper.registerVerification["village"]!,
                        );
                      } else {
                        return CustomDropDown(
                          flex: 3,
                          list: const [],
                          enabled: false,
                          label: "Kelurahan / Desa",
                          verification:
                              _registerHelper.registerVerification["village"]!,
                          errorText: "",
                        );
                      }
                    }),
              ),

              CustomTextFormField(
                label: "RT",
                length: 2,
                verification: _registerHelper.registerVerification["rt"]!,
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                label: "RW",
                length: 2,
                verification: _registerHelper.registerVerification["rw"]!,
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                label: "Kode Pos",
                length: 5,
                verification: _registerHelper.registerVerification["posCode"]!,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    ];
    return LayoutBuilder(
      builder: (context, constraint) {
        return CustomForm(
          formKey: _registerHelper.formKeyAuthentication.value,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              () => Stepper(
                currentStep: _registerHelper.currentStep.value,
                onStepContinue: () {
                  _registerHelper.handleNextButton();
                },
                onStepCancel: () {
                  if (_registerHelper.currentStep.value >= 0) {
                    _registerHelper.currentStep.value--;
                  }
                },
                controlsBuilder: (BuildContext context, _) {
                  final isFirstStep = _registerHelper.currentStep.value == 0;
                  final isLastStep = _registerHelper.currentStep.value == 2;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: isLastStep ? 150.0 : 100.0,
                        child: CustomFilledButton(
                          onPressed: !isLastStep ? _.onStepContinue : null,
                          label: isLastStep ? "Submit" : "Next",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 8.0),
                        child: CustomFlatTextButton(
                          isDisabled: isFirstStep ? true : false,
                          onPressed: isFirstStep ? null : _.onStepCancel,
                          child: const Text("Cancel"),
                        ),
                      ),
                    ],
                  );
                },
                steps: steps,
              ),
            ),
          ),
        );
      },
    );
  }
}
