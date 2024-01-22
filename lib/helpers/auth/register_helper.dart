import 'package:flutter/material.dart';
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
}
