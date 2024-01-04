import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterHelper extends GetxController {
  var registerData = {
    'NIK': '',
    'Email': '',
    'Password': '',
    'Nama': '',
    'TempatLahir': '',
    'TanggalLahir': '',
    'RT': '',
    'RW': '',
    'Kelurahan/Desa': '',
    'Kecamatan': '',
    'Kota/Kabupaten': '',
    'KodePos': '',
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
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController namaControler = TextEditingController();
  final TextEditingController tempatlahirControler = TextEditingController();
  final TextEditingController tanggallahirControler = TextEditingController();
  final TextEditingController rtControler = TextEditingController();
  final TextEditingController rwControler = TextEditingController();
  final TextEditingController desaControler = TextEditingController();
  final TextEditingController kecamatanControler = TextEditingController();
  final TextEditingController kabupatenControler = TextEditingController();
  final TextEditingController kodeposControler = TextEditingController();

  var nikVerification = false.obs;
  var emailVerification = false.obs;
  var passwordVerification = false.obs;
  var namaVerification = false.obs;
  var tempatlahirVerification = false.obs;
  var tanggallairVerification = false.obs;
  var rtVerification = false.obs;
  var rwVerification = false.obs;
  var desaVerification = false.obs;
  var kecamatanVerification = false.obs;
  var kabupatenVerification = false.obs;
  var kodeposVerification = false.obs;

  setRegisterData(name, value, isValid) {
    registerData[name] = value;
    switch (name) {
      case "NIK":
        isValid ? nikVerification.value = true : nikVerification.value = false;
        break;
      case "Email":
        isValid
            ? namaVerification.value = true
            : namaVerification.value = false;
        break;
      case "Password":
        isValid
            ? namaVerification.value = true
            : namaVerification.value = false;
        break;
      case "Nama":
        isValid
            ? tempatlahirVerification.value = true
            : tempatlahirVerification.value = false;
        break;
      case "TempatLahir":
        isValid
            ? namaVerification.value = true
            : namaVerification.value = false;
        break;
      case "TanggalLahir":
        isValid
            ? tanggallairVerification.value = true
            : tanggallairVerification.value = false;
        break;
      case "RT":
        isValid ? rtVerification.value = true : rtVerification.value = false;
        break;
      case "RW":
        isValid ? rwVerification.value = true : rwVerification.value = false;
        break;
      case "Kelurahan/Desa":
        isValid
            ? desaVerification.value = true
            : desaVerification.value = false;
        break;
      case "Kecamatan":
        isValid
            ? kecamatanVerification.value = true
            : kecamatanVerification.value = false;
        break;
      case "Kota/Kabupaten":
        isValid
            ? kabupatenVerification.value = true
            : kabupatenVerification.value = false;
        break;
      case "KodePos":
        isValid
            ? kodeposVerification.value = true
            : kodeposVerification.value = false;
      default:
    }
  }
}
