import 'package:flutter/material.dart';

// Items Organizer From Map
class Items {
  Items({
    required this.headers,
    required this.body,
    this.bodySecondary,
    this.trailing,
    this.onTap,
    this.isExpand = false,
  });

  final String headers;
  final Widget body;
  final Widget? bodySecondary;
  final Widget? trailing;
  final Function()? onTap;
  final bool? isExpand;
}

// Expansion Panel Headers

// Now is just Text But Near Future Can Use With Icon
class CustomHeaderExpansionPanel extends StatelessWidget {
  const CustomHeaderExpansionPanel({
    super.key,
    required this.title,
    this.color,
  });

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title != "" ? title : "Headers Not Found !",
        style: TextStyle(
          color: color != null
              ? title != ""
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.error
              : color,
        ),
      ),
    );
  }
}

// Expansion Panel Body

// Can Use Just With 1 Widget or List<Widget> by Using Warp, Column, or Row
class CustomBodyExpansionPanel extends StatelessWidget {
  const CustomBodyExpansionPanel({
    super.key,
    required this.body,
    this.bodySecondary,
    this.trailing,
    this.onTap,
    this.color,
  });

  final Widget body;
  final Widget? bodySecondary;
  final Widget? trailing;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: body,
      subtitle: bodySecondary,
      trailing: trailing,
      onTap: onTap,
    );
  }
}

// Create CustomExpansion Widget

// Requires List<Map> Data and Expansion Callback

// Expansion Callback to Set Which Index Has Expanded
class CustomExpandableWidget extends StatelessWidget {
  const CustomExpandableWidget({
    super.key,
    required this.expansionCallback,
    required this.data,
  });

  final Function(int, bool) expansionCallback;
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    List<Items> generateItems() {
      return List<Items>.generate(data.length, (index) {
        return Items(
          headers: data[index]["header"],
          body: data[index]["body"],
          bodySecondary: data[index]["bodySecondary"],
          trailing: data[index]["trailing"],
          onTap: data[index]["onTap"],
        );
      }).toList();
    }

    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: expansionCallback,
        children: generateItems().map<ExpansionPanel>((Items items) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: CustomHeaderExpansionPanel(title: items.headers),
              );
            },
            body: CustomBodyExpansionPanel(
              body: items.body,
              bodySecondary: items.bodySecondary,
              trailing: items.trailing,
              onTap: items.onTap,
            ),
          );
        }).toList(),
      ),
    );
  }
}
