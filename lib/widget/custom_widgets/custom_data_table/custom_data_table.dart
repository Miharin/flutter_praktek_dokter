import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({
    super.key,
    required this.title,
    required this.datalabel,
  });

  final List<String> title;
  final List<String> datalabel;

  @override
  Widget build(BuildContext context) {
    List<Widget> listtitle = title.map((label) => Text(label)).toList();
    List<Widget> listdatatitle = datalabel.map((label) => Text(label)).toList();

    return Flexible(
      flex: 1,
      child: DataTable(
        columns: listtitle.map((title) => DataColumn(label: title)).toList(),
        rows: [DataRow(cells: listdatatitle.map((e) => DataCell(e)).toList())],
      ),
    );
  }
}
