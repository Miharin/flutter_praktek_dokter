import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({
    super.key,
    required this.title,
    required this.datalabel,
  });

  final String title;
  final String datalabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(
              label: Text("Name"),
            ),
            DataColumn(
              label: Text("Test"),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text(datalabel),
                ),
                DataCell(
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Name"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
