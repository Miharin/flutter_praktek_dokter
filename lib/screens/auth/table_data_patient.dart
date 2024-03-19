import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_data_table/custom_data_table.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_textfromfield/custom_textformfield.dart';
// import 'package:gap/gap.dart';

class TableDataPatient extends StatelessWidget {
  const TableDataPatient({super.key});

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
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomTextFormField(
                            label: "Nama",
                            verification: true,
                          )
                        ],
                      ),
                    );
                  },
                )
              },
              child: const Text("Submit"),
            ),
          ],
        ),
        const Card(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomDataTable(
                title: ["aa", "bb"],
                datalabel: ["Alvin", "allvin"],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
