import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({
    super.key,
    required this.title,
    required this.datalabel,
  });

  final List<String> title;
  final List<Map<String, dynamic>> datalabel;

  @override
  Widget build(BuildContext context) {
    print(title);
    List<Widget> listtitle = title.map((label) => Text(label)).toList();

    return Flexible(
      flex: 1,
      child: DataTable(
        columns: listtitle.map((title) => DataColumn(label: title)).toList(),
        rows: datalabel.map((e) {
          return DataRow(
            cells: List.generate(
              title.length,
              (index) => DataCell(
                Text(e[title[index]]),
              ),
            ).toList(),
          );
        }).toList(),
      ),
    );
  }
}
