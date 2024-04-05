import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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

class Keys {
  final List<String> label;
  Keys({
    required this.label,
  });

  Keys.capitalize(this.label) {
    for (var element in label) {
      const List<String> keyForUpperCase = ["nik", "rt", "rw"];
      if (keyForUpperCase.where((key) => key.contains(element)).isNotEmpty) {
        label[label.indexOf(element)] = element.toUpperCase();
      } else if (element.contains("_")) {
        label[label.indexOf(element)] =
            element.split("_").join(" ").capitalize!;
      } else {
        label[label.indexOf(element)] = element.capitalize!;
      }
    }
  }
}

class VerificationData {
  final String name;
  final bool isValid;
  final int? length;

  VerificationData({
    required this.name,
    required this.isValid,
    this.length,
  });
}

class RegisterHelper extends GetxController {
  final RxInt currentStep = 0.obs;
  final formKeyAuthentication = GlobalKey<FormState>().obs;
  final formKeyIdentity = GlobalKey<FormState>().obs;
  final formKeyIdentityAddon = GlobalKey<FormState>().obs;
  final RxMap<String, bool> registerVerification = {
    "nik": false,
    "email": false,
    "password": false,
    "nama": false,
    "tempat_lahir": false,
    "tanggal_lahir": false,
    "provinsi": false,
    "kabupaten": false,
    "kecamatan": false,
    "kelurahan": false,
    "rt": false,
    "rw": false,
    "kode_pos": false,
  }.obs;

  final RxMap<String, dynamic> registerData = {
    "nik": "",
    "email": "",
    "password": "",
    "name": "",
    "birthPlace": "",
    "birthDate": "",
    "province": "",
    "regency": "",
    "district": "",
    "village": "",
    "rt": "",
    "rw": "",
    "posCode": "",
  }.obs;

  final RxString provincesValue = "0".obs;
  final RxString regenciesValue = "0".obs;
  final RxString districtsValue = "0".obs;
  final RxString villagesValue = "0".obs;

  void handleRegisterTextFormFieldChanged(name, value) {
    registerData[name] = value;
  }

  helperText(int start, int end) {
    final List verification =
        registerVerification.values.toList().getRange(start, end).toList();
    final List<String?> keys = Keys.capitalize(
      registerVerification.keys.toList().getRange(start, end).toList(),
    ).label;
    final List<String> textHelperValue = [];
    for (var i = 0; i < verification.length; i++) {
      if (!verification[i]) {
        textHelperValue.add(keys[i]!);
      }
    }
    String finalTextHelper = "${textHelperValue.join(", ")}"
        " "
        "${textHelperValue.isNotEmpty ? "Belum Sesuai" : "Sudah Lengkap"}";
    return Row(
      children: textHelperValue.isNotEmpty
          ? [
              Text(
                finalTextHelper,
                style: TextStyle(
                  color: textHelperValue.isEmpty ? Colors.green : Colors.red,
                ),
              ),
              const Gap(5.0),
              const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ]
          : [
              Text(
                finalTextHelper,
                style: TextStyle(
                  color: textHelperValue.isEmpty ? Colors.green : Colors.red,
                ),
              ),
              const Gap(5.0),
              const Icon(
                Icons.check,
                color: Colors.green,
              ),
            ],
    );
  }

  validatorRegister(String name, String? value) {
    // Not Done
    if (value!.isNotEmpty) {
      switch (name) {
        case "nik":
          if (value.length < 16) {
            handleVerification(name, registerVerification[name], false);
            return "NIK Wajib Diisi dan Minimal 16 Digit";
          } else {
            handleVerification(name, registerVerification[name], true);
          }
          break;
        case "email":
          if (!value.isEmail) {
            handleVerification(name, registerVerification[name], false);
            return "Email Tidak Sesuai Format";
          } else {
            handleVerification(name, registerVerification[name], true);
          }
          break;
        case "name":
          if (value.isEmpty) {
           handleVerification(name, registerVerification[name], false);
           return "Nama Wajib Diisi";
          } else {
           handleVerification(name, registerVerification[name], true);
          }
          break:
        case "password":
          if (value.length < 8) {
            handleVerification(name, registerVerification[name], false);
            return "Password Wajib Diisi dan Minimal Terdiri dari 8 Digit";
          } else {
            handleVerification(name, registerVerification[name], true);
          }
          break;
        default:
      }
    }
  }

  void handleVerification(name, verification, value) {
    registerVerification[name] = value;
    registerVerification.refresh();
  }

  handleNextButton() {
    if (currentStep.value <= 2) {
      currentStep.value++;
    }
  }

  getDataProvinces() async {
    final provincesData = [];
    final provinces = await get(
      Uri.parse(
          "https://miharin.github.io/api-wilayah-indonesia/api/provinces.json"),
    ).then((value) => jsonDecode(value.body));
    for (var province in provinces) {
      provincesData.add(Place.fromJson(province));
    }
    return provincesData;
  }

  getDataRegencies() async {
    final regenciesData = [];
    final regencies = await get(
      Uri.parse(
          "https://miharin.github.io/api-wilayah-indonesia/api/regencies/${regenciesValue.value}.json"),
    ).then((value) => jsonDecode(value.body));
    for (var regency in regencies) {
      regenciesData.add(Place.fromJson(regency));
    }
    return regenciesData;
  }

  getDataDistrict() async {
    final districtsData = [];
    final districts = await get(
      Uri.parse(
          "https://miharin.github.io/api-wilayah-indonesia/api/districts/${districtsValue.value}.json"),
    ).then((value) => jsonDecode(value.body));
    for (var district in districts) {
      districtsData.add(Place.fromJson(district));
    }
    return districtsData;
  }

  getDataVillage() async {
    final villagesData = [];
    final villages = await get(
      Uri.parse(
          "https://miharin.github.io/api-wilayah-indonesia/api/villages/${villagesValue.value}.json"),
    ).then((value) => jsonDecode(value.body));
    for (var village in villages) {
      villagesData.add(Place.fromJson(village));
    }
    return villagesData;
  }
}
