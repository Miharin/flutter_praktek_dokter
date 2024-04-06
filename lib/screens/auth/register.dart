import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_button/custom__text_button.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_button/custom_filled_button.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_drop_down/custom_drop_down.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_form/custom_form.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_textfromfield/custom_textformfield.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _registerHelper = Get.find<RegisterHelper>();

  @override
  Widget build(BuildContext context) {
    var dateTimeController = TextEditingController();
    _registerHelper.getDataProvinces(); // coba liat getx on init
    final steps = <Step>[
      Step(
        title: Obx(
          () => Row(
            children: [
              const Text("Autentikasi"),
              const Gap(5.0),
              _registerHelper.helperText(0, 3),
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
              Obx(
                () => CustomTextFormField(
                  label: "Password",
                  verification:
                      _registerHelper.registerVerification["password"]!,
                  obscureText: _registerHelper.passwordHide.value,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _registerHelper.togglePassword();
                    },
                    icon: _registerHelper.passwordHide.value
                        ? const Icon(
                            Icons.visibility,
                          )
                        : const Icon(
                            Icons.visibility_off,
                          ),
                  ),
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
              ),
            ],
          ),
        ),
      ),
      Step(
        title: Obx(
          () => Row(
            children: [
              const Text("Identitas"),
              const Gap(5.0),
              _registerHelper.helperText(3, 6),
            ],
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //onSave
              CustomTextFormField(
                label: "Nama",
                verification: _registerHelper.registerVerification["nama"]!,
                validator: (value) => _registerHelper.validatorRegister(
                  "nama",
                  value,
                ),
              ),
              CustomTextFormField(
                label: "Tempat Lahir",
                verification:
                    _registerHelper.registerVerification["tempat_lahir"]!,
              ),
              CustomTextFormField(
                  label: "Tanggal Lahir",
                  keyboardType: TextInputType.datetime,
                  controller: dateTimeController,
                  verification:
                      _registerHelper.registerVerification["tanggal_lahir"]!,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now());
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat.yMMMMd('in-in').format(pickedDate);
                      dateTimeController.text = formattedDate;
                    }
                  }),
            ],
          ),
        ),
      ),
      Step(
        title: Obx(
          () => Row(
            children: [
              const Text("Identitas Lengkap"),
              const Gap(5.0),
              _registerHelper.helperText(6, 13),
            ],
          ),
        ),
        content: Column(
          children: [
            Padding(
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
                            verification: _registerHelper
                                .registerVerification["provinsi"]!,
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
                            verification: _registerHelper
                                .registerVerification["provinsi"]!,
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
                              verification: _registerHelper
                                  .registerVerification["kabupaten"]!,
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
                                    .registerVerification["kabupaten"]!,
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
                              verification: _registerHelper
                                  .registerVerification["kecamatan"]!,
                              onSelected: (value) =>
                                  _registerHelper.villagesValue.value = value!,
                            );
                          } else {
                            return CustomDropDown(
                              flex: 3,
                              list: const [],
                              label: "Kecamatan",
                              enabled: false,
                              verification: _registerHelper
                                  .registerVerification["kecamatan"]!,
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
                              verification: _registerHelper
                                  .registerVerification["kelurahan"]!,
                            );
                          } else {
                            return CustomDropDown(
                              flex: 3,
                              list: const [],
                              enabled: false,
                              label: "Kelurahan / Desa",
                              verification: _registerHelper
                                  .registerVerification["kelurahan"]!,
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
                    verification:
                        _registerHelper.registerVerification["kode_pos"]!,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120.0,
                  child: CustomFilledButton(
                    onPressed: () {},
                    label: "Submit",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CustomFlatTextButton(
                    onPressed: () {
                      _registerHelper.currentStep.value--;
                    },
                    child: const Text("Cancel"),
                  ),
                ),
              ],
            )
          ],
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
                onStepTapped: (step) {
                  _registerHelper.currentStep.value = step;
                },
                controlsBuilder: (BuildContext context, _) {
                  final isFirstStep = _registerHelper.currentStep.value == 0;
                  final isLastStep = _registerHelper.currentStep.value == 2;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: isLastStep
                        ? []
                        : [
                            SizedBox(
                              width: 100.0,
                              child: CustomFilledButton(
                                onPressed: _.onStepContinue,
                                label: "Next",
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 8.0),
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
