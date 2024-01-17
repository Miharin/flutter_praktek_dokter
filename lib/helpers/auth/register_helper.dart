import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterHelper extends GetxController {
  final int lengthList = 12;

  generateList() {
    final List registerList = [{}];
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
      "icons": [
        Icons.badge_outlined,
        Icons.email_outlined,
        Icons.password_outlined,
        Icons.perm_identity_outlined,
        Icons.near_me_outlined,
        Icons.calendar_month_outlined,
        Icons.home_outlined,
        Icons.home_outlined,
        Icons.holiday_village_outlined,
        Icons.domain_outlined,
        Icons.location_city_outlined,
        Icons.pin_drop_outlined,
      ],
      "show-icons": List.generate(
        lengthList,
        (index) => true,
      ),
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
