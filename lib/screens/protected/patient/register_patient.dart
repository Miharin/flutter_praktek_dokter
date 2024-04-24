import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/protected/table_data_patient_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_card/custom_card.dart';
import 'package:flutter_praktek_dokter/widget/custom_textfromfield/custom_textformfield.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterPatient extends StatelessWidget {
  RegisterPatient({super.key});
  final DataPatientHelper _dataPatientHelper = Get.put(DataPatientHelper());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.5,
        child: CustomCardWithHeader(
          header: "Register Data Pasien",
          children: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CustomTextFormField(
                      label: "Nama Lengkap",
                      verification: true,
                      onSave: (value) =>
                          _dataPatientHelper.handleAddNewTableContent(
                        "nama",
                        value,
                      ),
                    ),
                    CustomTextFormField(
                      label: "NIK",
                      verification: true,
                      onSave: (value) =>
                          _dataPatientHelper.handleAddNewTableContent(
                        "nik",
                        value,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () =>
                            _dataPatientHelper.handleSubmitAddDataContent(),
                        label: const Text("ADD NEW LIST"),
                        icon: const Icon(Icons.add),
                      ),
                      const Gap(10.0),
                      ElevatedButton.icon(
                        onPressed: () => Get.back(),
                        label: const Text("Back"),
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
