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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomCardWithHeader(
              header: "Identitas",
              children: Row(
                mainAxisSize: MainAxisSize.min,
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
                    label: "Nomer Rekam Medis",
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
                  CustomTextFormField(
                    label: "Nama Ibu Kandung",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                ],
              ),
            ),
            CustomCardWithHeader(
              header: "Identitas",
              children: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    label: "Tempat Lahir",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Tanggal Lahir",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Jenis Kelamin",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Agama",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                ],
              ),
            ),
            CustomCardWithHeader(
              header: "Identitas",
              children: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    label: "Suku",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Bahasa Yang Dikuasai",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Alamat Lengkap",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "RT",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                ],
              ),
            ),
            CustomCardWithHeader(
              header: "Identitas",
              children: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    label: "RW",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Desa",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Kecamatan",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Kode Pos",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                ],
              ),
            ),
            CustomCardWithHeader(
              header: "Identitas",
              children: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    label: "Provinsi",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Negara",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Alamat Domisili",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "RT",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                ],
              ),
            ),
            CustomCardWithHeader(
              header: "Identitas",
              children: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    label: "RW",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Desa Domisili",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Kecamatan",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Kabupaten",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                ],
              ),
            ),
            CustomCardWithHeader(
              header: "Identitas",
              children: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    label: "Kode Pos",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Provinsi",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Negara",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Nomer Telepon Rumah",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                ],
              ),
            ),
            CustomCardWithHeader(
              header: "Identitas",
              children: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    label: "Nomer Telepon Selular Pasien",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Pendidikan",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "pekerjaan",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Status Pernikahan",
                    verification: true,
                    onSave: (value) =>
                        _dataPatientHelper.handleAddNewTableContent(
                      "nama",
                      value,
                    ),
                  ),
                ],
              ),
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
                    onPressed: () => Get.offAndToNamed("/test"),
                    label: const Text("Back"),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
