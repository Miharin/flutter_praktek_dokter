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

class RegisterHelper extends GetxController {
  final RxInt currentStep = 0.obs;
  final formKeyAuthentication = GlobalKey<FormState>().obs;
  final formKeyIdentity = GlobalKey<FormState>().obs;
  final formKeyIdentityAddon = GlobalKey<FormState>().obs;
  final RxMap<String, bool> registerVerification = {
    "nik": false,
    "email": false,
    "password": false,
    "name": false,
    "birthPlace": false,
    "birthDate": false,
    "province": false,
    "regency": false,
    "district": false,
    "village": false,
    "rt": false,
    "rw": false,
    "posCode": false,
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

  helperText(name) {
    switch (name) {
      case "authentication":
        final List verification = [];
        verification.addAll([
          registerVerification["nik"],
          registerVerification["email"],
          registerVerification["password"]
        ]);
        List textHelper = [];
        for (int i = 0; i < verification.length; i++) {
          if (!verification[i]) {
            switch (i) {
              case 0:
                textHelper.add("NIK");
                break;
              case 1:
                textHelper.add("Email");
                break;
              case 2:
                textHelper.add("Password");
                break;
              default:
            }
          }
        }
        String finalTextHelper =
            "${textHelper.join(", ")} ${textHelper.isNotEmpty ? "Belum Sesuai" : ""}";
        return finalTextHelper;
      default:
    }
  }

  validatorRegister(String name, String? value) {
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
