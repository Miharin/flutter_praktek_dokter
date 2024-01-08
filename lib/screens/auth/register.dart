import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_textfromfield/custom_textformfield.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterHelper _registerHelper = Get.put(RegisterHelper());

  @override
  Widget build(BuildContext context) {
    print(_registerHelper.nama);
    print(_registerHelper.listVerification);
    return LayoutBuilder(
      builder: (context, constraint) {
        final controller = _registerHelper.generateController(4);
        final verification = [];
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
          maxWidth: constraint.maxWidth <= 700
              ? (constraint.maxWidth - 100) / 2
              : (constraint.maxWidth - 200) / 4,
        );
        return Padding(
          padding: const EdgeInsets.all(20.0),
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
                        shape:
                            const RoundedRectangleBorder(side: BorderSide.none),
                        title: Center(
                          child: Text(
                            "Autentikasi".toUpperCase(),
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        children: [
                          const Divider(
                            indent: 20.0,
                            endIndent: 20.0,
                            color: Colors.black38,
                          ),
                          Obx(
                            () => CustomTextFromField(
                              listController: controller,
                              listLabel: const [
                                "Email",
                                "Password",
                                "NIK",
                                "Nama",
                              ],
                              type: const [
                                TextInputType.emailAddress,
                                TextInputType.text,
                                TextInputType.number,
                                TextInputType.datetime
                              ],
                              lengthList: 4,
                              constraints: constrainedV2,
                              verification:
                                  _registerHelper.listVerification.isEmpty,
                              errorText: 'Wajib Di Isi',
                            ),
                          ),
                        ],
                      ),
                    ),
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
