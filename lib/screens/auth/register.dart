import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_textfromfield/custom_textformfield.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterHelper _registerHelper = Get.put(RegisterHelper());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        // _registerHelper.tanggallahirControler.text =
        //     DateFormat.yMMMMd('in-in').format(DateTime.now()).toString();
        // _registerHelper.setRegisterData(
        //   "TanggalLahir",
        //   _registerHelper.tanggallahirControler.text,
        //   _registerHelper.tanggallahirControler.text.isNotEmpty,
        // );
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
                          top: 6.0,
                          left: 6.0,
                          right: 6.0,
                          bottom: 6.0,
                        ),
                        child: ExpansionTile(
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none),
                          title: Center(
                            child: Text(
                              "Autentikasi".toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          children: [
                            const Divider(
                              indent: 100.0,
                              endIndent: 100.0,
                              color: Colors.black38,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                CustomTextFromField(
                                  listLabel: const ["Email", "Password"],
                                  lengthList: 2,
                                  constraints: constrained,
                                  controller: _registerHelper.emailControler,
                                  verification:
                                      _registerHelper.emailVerification.value,
                                  errorText: 'Wajib Di Isi',
                                ),
                              ],
                            ),
                            const Gap(10.0),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                CustomTextFromField(
                                  listLabel: const ["NIK", "Nama"],
                                  lengthList: 2,
                                  constraints: constrained,
                                  controller: _registerHelper.nikControler,
                                  verification:
                                      _registerHelper.nikVerification.value,
                                  errorText: '',
                                )
                              ],
                            )
                          ],
                        ),
                      ),
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
