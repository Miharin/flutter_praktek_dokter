import 'package:get/get.dart';

class DataPatient {
  final String nama;

  DataPatient({required this.nama});
}

class DataPatientHelper extends GetxController {
  final RxList tableTitle = [].obs;
  final RxList<Map<String, dynamic>> tableContent = [
    {
      "Nama": "Name",
      "ID": "NIK",
    }
  ].obs;
  final RxMap<String, dynamic> addNewTableContentData = {"Nama": ""}.obs;

  handleAddNewTableContent(String name, dynamic value) {
    addNewTableContentData[name] = value;
  }

  handleNewTableContentOnSubmit() {
    tableContent.add(addNewTableContentData);
    tableContent.refresh();
  }
}
