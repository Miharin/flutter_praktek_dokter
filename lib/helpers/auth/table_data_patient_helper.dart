import 'package:get/get.dart';

class DataPatient {
  final String nama;

  DataPatient({required this.nama});
}

class DataPatientHelper extends GetxController {
  final RxList tableTitle = [].obs;
  final RxList tableContent = [].obs;
  final Map addNewTableContentData = {}.obs;

  handleAddNewTableContent(String name, dynamic value) {
    addNewTableContentData[name] = value;
  }

  handleNewTableContentOnSubmit() {
    tableContent.add(addNewTableContentData);
    tableContent.refresh();
  }
}
