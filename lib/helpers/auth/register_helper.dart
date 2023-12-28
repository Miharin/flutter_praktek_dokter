import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterHelper extends GetxController {
  var registerData = {
    'NIK': ''.obs,
    'Nama': ''.obs,
    'TempatLahir': ''.obs,
    'TanggalLahir': ''.obs,
    'JenisKelamin': ''.obs,
    'Agama': ''.obs,
    'GolonganDarah': ''.obs,
    'RT': ''.obs,
    'RW': ''.obs,
    'Kelurahan/Desa': ''.obs,
    'Kecamatan': ''.obs,
    'Kota/Kabupaten': ''.obs,
    'KodePos': ''.obs,
    'Provinsi': ''.obs,
    'Negara': ''.obs,
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
  final TextEditingController namaControler = TextEditingController();
  final TextEditingController tempatlahirControler = TextEditingController();
  final TextEditingController tanggallahirControler = TextEditingController();
  final TextEditingController jeniskelaminControler = TextEditingController();
  final TextEditingController agamaControler = TextEditingController();
  final TextEditingController rtControler = TextEditingController();
  final TextEditingController rwControler = TextEditingController();
  final TextEditingController desaControler = TextEditingController();
  final TextEditingController kecamatanControler = TextEditingController();
  final TextEditingController kabupatenControler = TextEditingController();
  final TextEditingController kodeposControler = TextEditingController();
  final TextEditingController provinsiControler = TextEditingController();
  final TextEditingController negaraControler = TextEditingController();
  final TextEditingController statusperkawinanControler =
      TextEditingController();
  final TextEditingController pekerjaanControler = TextEditingController();
  final TextEditingController kewarganegaraanControler =
      TextEditingController();

  var nikVerification = false.obs;
  var namaVerification = false.obs;
  var tempatlahirVerification = false.obs;
  var tanggallairVerification = false.obs;
  var jeniskelaminVerification = false.obs;
  var agamaVerification = false.obs;
  var rtVerification = false.obs;
  var rwVerification = false.obs;
  var desaVerification = false.obs;
  var kecamatanVerification = false.obs;
  var kabupatenVerification = false.obs;
  var kodeposVerification = false.obs;
  var provinsiVerification = false.obs;
  var negaraVerification = false.obs;
  var statusperkawinanVerification = false.obs;
  var pekerjaanVerification = false.obs;
  var kewarganegaraanVerification = false.obs;

  setRegisterData(name, value, isValid) {
    registerData[name] = value;
    switch (name) {
      case "NIK":
        isValid ? nikVerification.value = true : nikVerification.value = false;
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
      case "JenisKelamin":
        isValid
            ? jeniskelaminVerification.value = true
            : jeniskelaminVerification.value = false;
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
        break;
      case "Provinsi":
        isValid
            ? provinsiVerification.value = true
            : provinsiVerification.value = false;
        break;
      case "Negara":
        isValid
            ? negaraVerification.value = true
            : negaraVerification.value = false;
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
