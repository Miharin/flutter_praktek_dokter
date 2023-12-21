import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      this.obscureText,
      this.icon,
      this.border,
      required this.constraints,
      required this.onChanged});
  final String label;
  final BoxConstraints constraints;
  final bool? obscureText;
  final Icon? icon;
  final Function(String) onChanged;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          prefixIcon: icon,
          border: border ??
              const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
          label: Text(label),
          constraints: constraints),
    );
  }
}
