import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_card/custom_card.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_divider/custom_divider.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_expansion_panel/custom_expansion_panel.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_textfromfield/custom_textformfield.dart';
import 'package:get/get.dart';

class RegisterData {
  final String id;
  final String label;
  final TextEditingController controller;
  final TextInputType type;
  final bool verification;
  final String errorMessage;
  final IconData? icon;
  final bool showIcon;

  RegisterData({
    required this.id,
    required this.label,
    required this.controller,
    required this.errorMessage,
    this.icon,
    this.type = TextInputType.text,
    this.showIcon = false,
  }) : verification = false.obs.value;
}

class RegisterHelper extends GetxController {
  final List registerList = [
    RegisterData(
      id: "NIK",
      label: "NIK",
      controller: TextEditingController(),
      errorMessage:
          "NIK Wajib Diisi dan Panjang NIK Harus Sama Dengan 16 Digit",
    ),
    RegisterData(
      id: "Email",
      label: "Email",
      controller: TextEditingController(),
      errorMessage: "Email Wajib Diisi",
    ),
    RegisterData(
      id: "Password",
      label: "Password",
      controller: TextEditingController(),
      errorMessage:
          "Password Wajib Diisi dan Panjang Password Harus Lebih Dari 8 Digit",
    ),
    RegisterData(
      id: "NIK",
      label: "Nama",
      controller: TextEditingController(),
      errorMessage:
          "NIK Wajib Diisi dan Panjang NIK Harus Sama Dengan 16 Digit",
    ),
    RegisterData(
      id: "NIK",
      label: "Tempat Lahir",
      controller: TextEditingController(),
      errorMessage:
          "NIK Wajib Diisi dan Panjang NIK Harus Sama Dengan 16 Digit",
    ),
    RegisterData(
      id: "NIK",
      label: "Tanggal Lahir",
      controller: TextEditingController(),
      errorMessage:
          "NIK Wajib Diisi dan Panjang NIK Harus Sama Dengan 16 Digit",
      type: TextInputType.datetime,
    ),
    RegisterData(
      id: "NIK",
      label: "NIK",
      controller: TextEditingController(),
      errorMessage:
          "NIK Wajib Diisi dan Panjang NIK Harus Sama Dengan 16 Digit",
    ),
    RegisterData(
      id: "NIK",
      label: "NIK",
      controller: TextEditingController(),
      errorMessage:
          "NIK Wajib Diisi dan Panjang NIK Harus Sama Dengan 16 Digit",
    ),
    RegisterData(
      id: "NIK",
      label: "NIK",
      controller: TextEditingController(),
      errorMessage:
          "NIK Wajib Diisi dan Panjang NIK Harus Sama Dengan 16 Digit",
    ),
    RegisterData(
      id: "NIK",
      label: "NIK",
      controller: TextEditingController(),
      errorMessage:
          "NIK Wajib Diisi dan Panjang NIK Harus Sama Dengan 16 Digit",
    ),
    RegisterData(
      id: "NIK",
      label: "NIK",
      controller: TextEditingController(),
      errorMessage:
          "NIK Wajib Diisi dan Panjang NIK Harus Sama Dengan 16 Digit",
    ),
    RegisterData(
      id: "NIK",
      label: "NIK",
      controller: TextEditingController(),
      errorMessage:
          "NIK Wajib Diisi dan Panjang NIK Harus Sama Dengan 16 Digit",
    ),
  ].obs;
  final int lengthList = 12;
  generetePanelItems() {
    List panelItem = [
      ExpansionPanelItem(
        title: "Identity Additionals",
        body: Obx(
          () => CustomCardWithHeader(
            header: "Identity Add",
            fontzise: 18.0,
            fontweight: FontWeight.bold,
            divider: const CustomDivider(
              space: 20.0,
            ),
            children: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                3,
                (index) {
                  index = index + 6;
                  return CustomTextFormField(
                    label: registerList[index].label,
                    controller: registerList[index].controller,
                    verification: registerList[index].verification,
                    keyboardType: registerList[index].type,
                    onSave: (value) => print(value),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    ].obs;
    return panelItem;
  }

  togglePanel(int index, List panelItems) {
    panelItems[index].isExpanded.value = !panelItems[index].isExpanded.value;
    print(panelItems[index].isExpanded);
  }
}
