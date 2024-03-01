import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
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

class Provinces {
  final String provinces;
  final String provincesid;

  Provinces(this.provinces, this.provincesid);

  Provinces.fromJson(Map<String, dynamic> json)
      : provinces = json["name"] as String,
        provincesid = json["id"] as String;

  Map<String, dynamic> toJson() => {
        "Provinces": provinces,
        "ProvincesId": provincesid,
      };
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
      id: "Name",
      label: "Nama",
      controller: TextEditingController(),
      errorMessage: "Nama Wajib Diisi",
    ),
    RegisterData(
      id: "Location_Birth",
      label: "Tempat Lahir",
      controller: TextEditingController(),
      errorMessage: "Tempat Lahir Wajib Diisi",
    ),
    RegisterData(
      id: "Date_Birth",
      label: "Tanggal Lahir",
      controller: TextEditingController(),
      errorMessage: "Tanggal Lahir Wajib Diisi",
      type: TextInputType.datetime,
    ),
    RegisterData(
      id: "Provinces",
      label: "Provinsi",
      controller: TextEditingController(),
      errorMessage: "",
    ),
    RegisterData(
      id: "RW",
      label: "RW",
      controller: TextEditingController(),
      errorMessage: "",
    ),
    RegisterData(
      id: "Desa",
      label: "Kelurahan / Desa",
      controller: TextEditingController(),
      errorMessage: "",
    ),
    RegisterData(
      id: "Kecamatan",
      label: "Kecamatan",
      controller: TextEditingController(),
      errorMessage: "",
    ),
    RegisterData(
      id: "Kota",
      label: "Kota / Kabupaten",
      controller: TextEditingController(),
      errorMessage: "",
    ),
    RegisterData(
      id: "Code_Pos",
      label: "Kode Pos",
      controller: TextEditingController(),
      errorMessage: "",
    ),
  ].obs;

  getDataFromAPI() async {
    final provinces = await get(
      Uri.parse(
          "https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json"),
    ).then((value) => jsonDecode(value.body) as List<dynamic>);
    final listProvinces = List.generate(
            provinces.length, (index) => Provinces.fromJson(provinces[index]))
        .toList();
    print(listProvinces[0].provincesid);
    for (var i = 0; i < listProvinces.length; i++) {}
  }
}
