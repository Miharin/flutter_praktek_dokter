import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterHelper extends GetxController {
  var registerData = {
    'NIK': ''.obs,
    'TempatLahir': ''.obs,
    'TanggalLahir': ''.obs,
    'JenisKelamin': ''.obs,
    'GolonganDarah': ''.obs,
    'Agama': ''.obs,
    'StatusPerkawinan': ''.obs,
    'Pekerjaan': ''.obs,
    'Kewarganegaraan': ''.obs,
  }.obs;

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

  final TextEditingController nikControler = TextEditingController();
  final TextEditingController tempatlahirControler = TextEditingController();
  final TextEditingController tanggallahirControler = TextEditingController();
  final TextEditingController jeniskelaminControler = TextEditingController();
  final TextEditingController golongandarahControler = TextEditingController();
  final TextEditingController agamaControler = TextEditingController();
  final TextEditingController statusperkawinanControler =
      TextEditingController();
  final TextEditingController pekerjaanControler = TextEditingController();
  final TextEditingController kewarganegaraanControler =
      TextEditingController();

  var nikVerification = false.obs;
  var tempatlahirVerification = false.obs;
  var tanggallairVerification = false.obs;
  var jeniskelaminVerification = false.obs;
  var golongandarahVerification = false.obs;
  var agamaVerification = false.obs;
  var statusperkawinanVerification = false.obs;
  var pekerjaanVerification = false.obs;
  var kewarganegaraanVerification = false.obs;

  setRegisterData(name, value, isValid) {
    registerData[name] = value;
    switch (name) {
      case "NIK":
        isValid ? nikVerification.value = true : nikVerification.value = false;
        break;
      case "TempatLahir":
        isValid
            ? tempatlahirVerification.value = true
            : tempatlahirVerification.value = false;
        break;
      case "TanggalLahir":
        isValid
            ? tanggallairVerification.value = true
            : tanggallairVerification.value = false;
        break;
      case "JenisKelamin":
        isValid
            ? jeniskelaminVerification.value = true
            : jeniskelaminVerification.value = false;
        break;
      case "GolonganDarah":
        isValid
            ? golongandarahVerification.value = true
            : golongandarahVerification.value = false;
        break;
      case "Agama":
        isValid
            ? agamaVerification.value = true
            : agamaVerification.value = false;
        break;
      case "StatusPerkawinan":
        isValid
            ? statusperkawinanVerification.value = true
            : statusperkawinanVerification.value = false;
        break;
      case "Pekerjaan":
        isValid
            ? pekerjaanVerification.value = true
            : pekerjaanVerification.value = false;
        break;
      case "Kewarganegaraan":
        isValid
            ? kewarganegaraanVerification.value = true
            : kewarganegaraanVerification.value = false;
      default:
    }
  }
}
