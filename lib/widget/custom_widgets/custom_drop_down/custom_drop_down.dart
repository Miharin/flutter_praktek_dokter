import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.onSelected,
    required this.list,
    required this.label,
    required this.verification,
    required this.errorText,
  });
  final String label;
  final List<dynamic> list;
  final bool verification;
  final String? errorText;
  final void Function(String?)? onSelected;

  @override
  Widget build(BuildContext context) {
    // var errorVerificationFinal = !verification && controller.text.isNotEmpty;
    return Flexible(
      flex: 1,
      child: DropdownMenu<String>(
        expandedInsets: EdgeInsets.zero,
        menuHeight: MediaQuery.of(context).size.height * 0.35,
        enableFilter: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
                width: 1.0,
              )),
        ),
        label: Text(label),
        onSelected: onSelected,
        dropdownMenuEntries:
            list.map<DropdownMenuEntry<String>>((dynamic value) {
          return DropdownMenuEntry<String>(value: value.id, label: value.name);
        }).toList(),
      ),
    );
  }
}
