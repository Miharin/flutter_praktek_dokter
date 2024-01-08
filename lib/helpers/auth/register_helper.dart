import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterHelper extends GetxController {
  final List nama = [
    'NIK',
    'Email',
    'Password',
    'Nama',
    'TempatLahir',
    'TanggalLahir',
    'RT',
    'RW',
    'Kelurahan/Desa',
    'Kecamatan',
    'Kota/Kabupaten',
    'KodePos',
  ].obs;
  generatenama(lenghtlistverification) {
    for (var i = 0; i < lenghtlistverification; i++) {
      nama.add(());
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

  final List listVerification = List.generate(13, (index) => false).obs;
  generateVerification(lenghtlistverification) {
    for (var i = 0; i < lenghtlistverification; i++) {
      listVerification.add(());
    }
  }

  final List<TextEditingController> listController =
      List.generate(13, (index) => TextEditingController());

  generateController(lengthList) {
    for (var i = 0; i < lengthList; i++) {
      listController.add(TextEditingController());
    }
    return listController;
  }

  setRegisterData(name, value, isValid) {
    final Map<String, dynamic> list = {
      "nama": nama,
      "verification": listVerification,
      "length": 13
    };
    for (var i = 0; i < list["lenght"]; i++) {
      if ("tanggal" == list["nama"]![i]) {
        list["verification"]![i] = true;
      }
    }
  }
}
