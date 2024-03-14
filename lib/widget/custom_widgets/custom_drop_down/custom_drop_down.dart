import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const   CustomDropDown({
    super.key,
    this.onSelected,
    required this.list,
    required this.label,
    required this.controller,
    required this.verification,
    required this.errorText,
  });
  final String label;
  final List<dynamic> list;
  final TextEditingController controller;
  final bool verification;
  final String? errorText;
  final void Function(String?)? onSelected;

  @override
  Widget build(BuildContext context) {
    // var errorVerificationFinal = !verification && controller.text.isNotEmpty;
    return DropdownMenu<String>(
      controller: controller,
      expandedInsets: EdgeInsets.zero,
      menuHeight: MediaQuery.of(context).size.height * 0.35,
      enableFilter: true,
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
      label: Text(label),
      onSelected: onSelected,
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((dynamic value) {
        return DropdownMenuEntry<String>(value: value.id, label: value.name);
      }).toList(),
    );
  }
}
