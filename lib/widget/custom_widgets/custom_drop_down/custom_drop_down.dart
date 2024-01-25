import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.list,
    required this.label,
    required this.controller,
    required this.verification,
    required this.errorText,
    this.menuHeight,
    this.width,
  });
  final String label;
  final List<String> list;
  final TextEditingController controller;
  final bool verification;
  final String errorText;

  final double? menuHeight;
  final double? width;

  @override
  Widget build(BuildContext context) {
    // var errorVerificationFinal = !verification && controller.text.isNotEmpty;
    return LayoutBuilder(builder: (context, constraints) {
      return DropdownMenu<String>(
        controller: TextEditingController(),
        width: width,
        menuHeight: menuHeight,
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)))),
        label: Text(label),
        onSelected: (String? value) {},
        dropdownMenuEntries:
            list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      );
    });
  }
}
