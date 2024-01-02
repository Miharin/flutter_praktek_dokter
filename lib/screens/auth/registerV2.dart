import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_text_field/custom_text_field.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterScreenV2 extends StatelessWidget {
  RegisterScreenV2({super.key});

  final RegisterHelper _registerHelper = Get.put(RegisterHelper());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
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
                          title: const Center(child: Text("Autentikasi")),
                          children: [
                            const Divider(
                              color: Colors.black38,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Gap(10.0),
                                CustomTextField(
                                    label: "Email",
                                    constraints: constrained,
                                    onChanged: (value) => {},
                                    controller: _registerHelper.emailControler,
                                    verification:
                                        _registerHelper.emailVerification.value,
                                    errorText: "Wajib Di Isi"),
                                const Gap(50.0),
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Gap(10.0),
                                CustomTextField(
                                    label: "NIK",
                                    constraints: constrained,
                                    onChanged: (value) => {},
                                    controller: _registerHelper.nikControler,
                                    verification:
                                        _registerHelper.nikVerification.value,
                                    errorText: "Wajib Di Isi"),
                                const Gap(50.0),
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
                          title: const Center(child: Text("Profile")),
                          children: [
                            const Divider(
                              color: Colors.black38,
                            ),
                            const Gap(10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
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
                                const Gap(60.0),
                                CustomTextField(
                                    label: "Tanggal Lahir",
                                    constraints: constrained,
                                    onChanged: (value) => {},
                                    controller:
                                        _registerHelper.tanggallahirControler,
                                    verification: _registerHelper
                                        .tanggallairVerification.value,
                                    errorText: "Wajib Di Isi"),
                              ],
                            ),
                            const Gap(10.0),
                            ExpansionTile(
                              title: const Center(child: Text("Alamat")),
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide.none),
                              children: [
                                const Divider(
                                  color: Colors.black38,
                                ),
                                const Gap(10.0),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomTextField(
                                        label: "RT",
                                        constraints: constrainedV2,
                                        onChanged: (value) => {},
                                        controller: _registerHelper.rtControler,
                                        verification: _registerHelper
                                            .rtVerification.value,
                                        errorText: "Wajib Di Isi"),
                                    const Gap(50.0),
                                    CustomTextField(
                                        label: "RW",
                                        constraints: constrainedV2,
                                        onChanged: (value) => {},
                                        controller: _registerHelper.rwControler,
                                        verification: _registerHelper
                                            .rwVerification.value,
                                        errorText: "Wajib Di Isi"),
                                    const Gap(50.0),
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
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
                                    const Gap(50.0),
                                    CustomTextField(
                                        label: "Kota/Kabupaten",
                                        constraints: constrainedV2,
                                        onChanged: (value) => {},
                                        controller:
                                            _registerHelper.kabupatenControler,
                                        verification: _registerHelper
                                            .kabupatenVerification.value,
                                        errorText: "Wajib Di Isi"),
                                    const Gap(50.0),
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
