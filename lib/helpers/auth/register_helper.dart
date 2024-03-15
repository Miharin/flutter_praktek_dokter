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

class Regencies {
  final String regencies;
  final String regenciesid;

  Regencies(this.regencies, this.regenciesid);

  Regencies.fromJson(Map<String, dynamic> json)
      : regencies = json["name"] as String,
        regenciesid = json["id"] as String;

  Map<String, dynamic> toJson() => {
        "Regencies": regencies,
        "Regenciesid": regenciesid,
      };
}

class Districts {
  final String districts;
  final String districtsid;

  Districts(this.districts, this.districtsid);

  Districts.fromJson(Map<String, dynamic> json)
      : districts = json["name"] as String,
        districtsid = json["id"] as String;

  Map<String, dynamic> toJson() => {
        "Districts": districts,
        "Districtsid": districtsid,
      };
}

class Villages {
  final String villages;
  final String villagesid;

  Villages(this.villages, this.villagesid);

  Villages.fromJson(Map<String, dynamic> json)
      : villages = json["name"] as String,
        villagesid = json["id"] as String;

  Map<String, dynamic> toJson() => {
        "Villages": villages,
        "Villagesid": villagesid,
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
      label: "Prvinsi",
      controller: TextEditingController(),
      errorMessage: "",
      type: TextInputType.streetAddress,
      onSave: (value) => {},
    ),
    RegisterData(
      id: "Kota",
      label: "Kota / Kabupaten",
      controller: TextEditingController(),
      errorMessage: "",
      type: TextInputType.streetAddress,
      onSave: (value) => {},
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

  // functionProvince(value) {
  //   provincesValue.value = value!;
  //   print(provincesValue.value);
  //   getDataProvinces();
  // }

  // functionRegencies(value) {
  //   regenciesValue.value = value!;
  //   print(regenciesValue.value);
  //   getDataRegencies(regenciesValue);
  // }

  // functionDistricts(value) {
  //   districtsValue.value = value!;
  //   print(districtsValue.value);
  //   getDataDistrict(districtsValue);
  // }

  // fungtionVillages(value) {
  //   villagesValue.value = value!;
  //   print(villagesValue.value);
  //   getDataVillage(villagesValue);
  // }

  getDataProvinces() async {
    final provincesID =
        provincesValue.value != "0" ? provincesValue.value : "35";
    final provinces = await get(
      Uri.parse(
          "https://miharin.github.io/api-wilayah-indonesia/api/provinces.json"),
    ).then((value) => jsonDecode(value.body));
    final provincesData = [];
    for (var province in provinces) {
      provincesData.add(Place.fromJson(province));
    }
    return provincesData;
  }

  getDataRegencies() async {
    final regenciesData = [];
    final regenciesID = regenciesValue;
    final regencies = await get(
      Uri.parse(
          "https://miharin.github.io/api-wilayah-indonesia/api/regencies/$regenciesID.json"),
    ).then((value) => jsonDecode(value.body));
    print(regenciesValue);
    for (var regencie in regencies) {
      regenciesData.add(Place.fromJson(regencie));
    }
    return regenciesData;
  }

  getDataDistrict() async {
    final districtsData = [];
    final districtsID = districtsValue;
    final districts = await get(
      Uri.parse(
          "https://miharin.github.io/api-wilayah-indonesia/api/districts/$districtsID.json"),
    ).then((value) => jsonDecode(value.body));
    for (var district in districts) {
      districtsData.add(Place.fromJson(district));
    }
    return districtsData;
  }

  getDataVillage() async {
    final villagesData = [];
    final villagesID = villagesValue;
    final villages = await get(
      Uri.parse(
          "https://miharin.github.io/api-wilayah-indonesia/api/villages/$villagesID.json"),
    ).then((value) => jsonDecode(value.body));
    for (var village in villages) {
      villagesData.add(Place.fromJson(village));
    }
    return villagesData;
  }

  var provincesValue = "0".obs;
  var regenciesValue = "0".obs;
  var districtsValue = "0".obs;
  var villagesValue = "0".obs;

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
}
