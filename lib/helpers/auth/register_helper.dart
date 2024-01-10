import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterHelper extends GetxController {
  final int lengthList = 12;

  generateList() {
    final Map listRegister = {
      "length": lengthList,
      "breakpoint": [3, 6, lengthList],
      "breakpoint_title": [
        "AUTENTIKASI",
        "BIO DATA",
        "BIO DATA LENGKAP",
      ],
      "id": [
        "NIK",
        "Email",
        "Password",
        "Nama",
        "TempatLahir",
        "TanggalLahir",
        "RT",
        "RW",
        "Kelurahan/Desa",
        "Kecamatan",
        "Kota/Kabupaten",
        "KodePos",
      ],
      "label": [
        "NIK",
        "Email",
        "Password",
        "Nama",
        "Tempat Lahir",
        "Tanggal Lahir",
        "RT",
        "RW",
        "Kelurahan / Desa",
        "Kecamatan",
        "Kota / Kabupaten",
        "Kode Pos",
      ],
      "type": [
        TextInputType.number,
        TextInputType.emailAddress,
        TextInputType.text,
        TextInputType.text,
        TextInputType.text,
        TextInputType.datetime,
        TextInputType.number,
        TextInputType.number,
        TextInputType.text,
        TextInputType.text,
        TextInputType.text,
        TextInputType.number,
      ],
      "value": List.generate(lengthList, (index) => ""),
      "controller":
          List.generate(lengthList, (index) => TextEditingController()),
      "verification": List.generate(lengthList, (index) => false),
      "required_parameters": [],
      "error_text": List.generate(lengthList, (index) => "Wajib Di Isi"),
    }.obs;
    return listRegister;
  }

  setRegisterData(data, value, isValid) {
    data = value;
    print(data);
    if (isValid == true) {
      data = value;
    }
  }

  var index = 0.obs;

  onStepCancel(currentIndex) {
    if (currentIndex > 0) {
      index.value = currentIndex - 1;
    }
  }

  onStepContinue(totalSteps) {
    if (index >= 0 && index < totalSteps - 1) {
      index.value += 1;
    }
  }

  onStepTapped(currentIndex) {
    index.value = currentIndex;
  }
}
