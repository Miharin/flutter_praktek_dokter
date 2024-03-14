import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:get/get.dart';

class Place {
  final String id;
  final String name;

  Place({
    required this.id,
    required this.name,
  });

  Place.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String;
}

class RegisterData {
  final String id;
  final String label;
  final TextEditingController controller;
  final TextInputType type;
  final bool verification;
  final String errorMessage;
  final IconData? icon;
  final bool showIcon;
  final Function(String?)? onSave;

  RegisterData(
      {required this.id,
      required this.label,
      required this.controller,
      required this.errorMessage,
      this.icon,
      this.type = TextInputType.text,
      this.showIcon = false,
      this.onSave})
      : verification = false.obs.value;
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
      id: "Province",
      label: "Provinsi",
      controller: TextEditingController(),
      errorMessage: "",
      onSave: (value) => {},
    ),
    RegisterData(
      id: "Kota",
      label: "Kota / Kabupaten",
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
      id: "Desa",
      label: "Kelurahan / Desa",
      controller: TextEditingController(),
      errorMessage: "",
    ),
    RegisterData(
      id: "RT",
      label: "RT",
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
      id: "Code_Pos",
      label: "Kode Pos",
      controller: TextEditingController(),
      errorMessage: "",
    ),
  ].obs;

  functionProvince(value) {
    provincesValue.value = value!;
    print(provincesValue.value);
    getDataFromAPI();
  }

  getDataFromAPI() async {
    final provincesID =
        provincesValue.value != "0" ? provincesValue.value : "35";
    final provinces = await get(
      Uri.parse(
          "https://miharin.github.io/api-wilayah-indonesia/api/provinces.json"),
    ).then((value) => jsonDecode(value.body));
    final regencies = await get(
      Uri.parse(
          "https://miharin.github.io/api-wilayah-indonesia/api/regencies/${provincesID}.json"),
    ).then((value) => jsonDecode(value.body));
    final place = [];
    for (var province in provinces) {
      place.add(Place.fromJson(province));
    }

    return place;
  }

  var provincesValue = "0".obs;
}
