import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/table_data_patient_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_data_table/custom_data_table.dart';
import 'package:get/get.dart';
// import 'package:gap/gap.dart';

class TableDataPatient extends StatelessWidget {
  TableDataPatient({super.key});

  final datapatienthelper = Get.put(DataPatientHelper());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton(
              onPressed: () => Get.toNamed('/test1'),
              child: const Text("Submit"),
            ),
          ],
        ),
        Card(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomDataTable(
                title: const [
                  "Nama",
                  "ID",
                ],
                datalabel: datapatienthelper.tableContent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
