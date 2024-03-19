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

class RegisterHelper extends GetxController {
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

  var nikVerification = false.obs;
  var emailVerification = false.obs;
  var passwordVerification = false.obs;
  var namaVerification = false.obs;
  var tempatlahirVerification = false.obs;
  var taggallahirVerification = false.obs;
  var provinsiVerification = false.obs;
  var kotaVerification = false.obs;
  var kecamatanVerification = false.obs;
  var kelurahanVerification = false.obs;
  var rtVerification = false.obs;
  var rwVerification = false.obs;
  var kodeposVerification = false.obs;
  final RxString provincesValue = "0".obs;
  final RxString regenciesValue = "0".obs;
  final RxString districtsValue = "0".obs;
  final RxString villagesValue = "0".obs;

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
