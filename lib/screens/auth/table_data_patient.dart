import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_data_table/custom_data_table.dart';

class TableDataPatient extends StatelessWidget {
  const TableDataPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomDataTable(
      title: "Nama",
      datalabel: "Alvin",
    );
  }
}
