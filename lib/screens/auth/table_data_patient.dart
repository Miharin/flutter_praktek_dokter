import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/table_data_patient_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_data_table/custom_data_table.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_textfromfield/custom_textformfield.dart';
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
              onPressed: () => {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        CustomTextFormField(
                                          label: "Nama Lengkap",
                                          verification: true,
                                          onSave: (value) => print(value),
                                        ),
                                        CustomTextFormField(
                                          label: "ID",
                                          verification: true,
                                        ),
                                        IconButton.outlined(
                                          onPressed: () => {},
                                          icon: const Icon(Icons.add),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              },
              child: const Text("Submit"),
            ),
          ],
        ),
        Card(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomDataTable(
                title: ["Nama", "ID"],
                datalabel: datapatienthelper.tableContent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
