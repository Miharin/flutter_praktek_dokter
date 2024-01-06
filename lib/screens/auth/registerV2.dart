import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_text_field/custom_text_field.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterScreenV2 extends StatelessWidget {
  RegisterScreenV2({super.key});

  final RegisterHelper _registerHelper = Get.put(RegisterHelper());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      _registerHelper.tanggallahirControler.text =
          DateFormat.yMMMMd('in-in').format(DateTime.now()).toString();
      _registerHelper.setRegisterData(
        "TanggalLahir",
        _registerHelper.tanggallahirControler.text,
        _registerHelper.tanggallahirControler.text.isNotEmpty,
      );
      var constrained = BoxConstraints(
        maxWidth: constraint.maxWidth > 700 ? 700 : constraint.maxWidth * 0.8,
        minWidth: constraint.maxWidth > 700 ? 700 : constraint.maxWidth * 0.8,
      );
      var constrainedV2 = BoxConstraints(
        maxWidth: constraint.maxWidth > 500 ? 500 : constraint.maxWidth * 0.8,
        minWidth: constraint.maxWidth > 500 ? 500 : constraint.maxWidth * 0.8,
      );
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                        child: ExpansionTile(
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none),
                          title: const Center(
                              child: Text(
                            "AUTENTIKASI",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )),
                          children: [
                            const Divider(
                              indent: 125.0,
                              endIndent: 125.0,
                              color: Colors.black38,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                CustomTextField(
                                    label: "Email",
                                    constraints: constrained,
                                    onChanged: (value) => {},
                                    controller: _registerHelper.emailControler,
                                    verification:
                                        _registerHelper.emailVerification.value,
                                    errorText: "Wajib Di Isi"),
                                CustomTextField(
                                    label: "Password",
                                    constraints: constrained,
                                    onChanged: (value) => {},
                                    controller:
                                        _registerHelper.passwordControler,
                                    verification: _registerHelper
                                        .passwordVerification.value,
                                    errorText: "Wajib Di Isi"),
                              ],
                            ),
                            const Gap(10.0),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                CustomTextField(
                                    label: "NIK",
                                    constraints: constrained,
                                    onChanged: (value) => {},
                                    controller: _registerHelper.nikControler,
                                    verification:
                                        _registerHelper.nikVerification.value,
                                    errorText: "Wajib Di Isi"),
                                CustomTextField(
                                    label: "Nama",
                                    constraints: constrained,
                                    onChanged: (value) => {},
                                    controller: _registerHelper.namaControler,
                                    verification:
                                        _registerHelper.namaVerification.value,
                                    errorText: "Wajib Di Isi"),
                              ],
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                        child: ExpansionTile(
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none),
                          title: const Center(
                              child: Text(
                            "PROFILE",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )),
                          children: [
                            const Divider(
                              indent: 125.0,
                              endIndent: 125.0,
                              color: Colors.black38,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                CustomTextField(
                                    label: "Tempat Lahir",
                                    constraints: constrained,
                                    onChanged: (value) => {},
                                    controller:
                                        _registerHelper.tempatlahirControler,
                                    verification: _registerHelper
                                        .tempatlahirVerification.value,
                                    errorText: "Wajib Di Isi"),
                                CustomTextField(
                                  icon: Icons.calendar_today,
                                  readonly: true,
                                  label: 'TanggaLahir',
                                  constraints: constrained,
                                  ontap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                        initialDate: DateTime.now());
                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat.yMMMMd('in-in')
                                              .format(pickedDate);
                                      _registerHelper.tanggallahirControler
                                          .text = formattedDate;
                                      _registerHelper.setRegisterData(
                                        "TanggalLahir",
                                        _registerHelper
                                            .tanggallahirControler.text,
                                        _registerHelper.tanggallahirControler
                                            .text.isNotEmpty,
                                      );
                                    }
                                  },
                                  controller:
                                      _registerHelper.tanggallahirControler,
                                  verification: _registerHelper
                                      .tanggallairVerification.value,
                                  errorText: 'Wajib Di Isi',
                                ),
                              ],
                            ),
                            const Gap(10.0),
                            ExpansionTile(
                              title: const Center(
                                  child: Text(
                                "Alamat",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              )),
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide.none),
                              children: [
                                const Divider(
                                  indent: 125.0,
                                  endIndent: 125.0,
                                  color: Colors.black38,
                                ),
                                Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    CustomTextField(
                                        label: "RT",
                                        constraints: constrainedV2,
                                        onChanged: (value) => {},
                                        controller: _registerHelper.rtControler,
                                        verification: _registerHelper
                                            .rtVerification.value,
                                        errorText: "Wajib Di Isi"),
                                    CustomTextField(
                                        label: "RW",
                                        constraints: constrainedV2,
                                        onChanged: (value) => {},
                                        controller: _registerHelper.rwControler,
                                        verification: _registerHelper
                                            .rwVerification.value,
                                        errorText: "Wajib Di Isi"),
                                    CustomTextField(
                                        label: "Kelurahan/Desa",
                                        constraints: constrainedV2,
                                        onChanged: (value) => {},
                                        controller:
                                            _registerHelper.desaControler,
                                        verification: _registerHelper
                                            .desaVerification.value,
                                        errorText: "Wajib Di Isi"),
                                  ],
                                ),
                                const Gap(10.0),
                                Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    CustomTextField(
                                        label: "Kecamatan",
                                        constraints: constrainedV2,
                                        onChanged: (value) => {},
                                        controller:
                                            _registerHelper.kecamatanControler,
                                        verification: _registerHelper
                                            .kecamatanVerification.value,
                                        errorText: "Wajib Di Isi"),
                                    CustomTextField(
                                        label: "Kota/Kabupaten",
                                        constraints: constrainedV2,
                                        onChanged: (value) => {},
                                        controller:
                                            _registerHelper.kabupatenControler,
                                        verification: _registerHelper
                                            .kabupatenVerification.value,
                                        errorText: "Wajib Di Isi"),
                                    CustomTextField(
                                        label: "KodePos",
                                        constraints: constrainedV2,
                                        onChanged: (value) => {},
                                        controller:
                                            _registerHelper.kodeposControler,
                                        verification: _registerHelper
                                            .kodeposVerification.value,
                                        errorText: "Wajib Di Isi"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class CalenderPicker extends GetxController {
  TextEditingController dateinput = TextEditingController();

  calenderPicker(formattedDate) {
    dateinput.text = formattedDate;
  }

  @override
  void dispose() {
    dateinput.dispose();
    super.dispose();
  }
}
