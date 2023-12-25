import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.constraints,
    required this.onChanged,
    required this.controller,
    required this.verification,
    required this.errorText,
    this.obscureText,
    this.icon,
    this.border,
  });
  final TextEditingController controller;
  final String label;
  final Function(String) onChanged;
  final bool verification;
  final String errorText;
  final BoxConstraints constraints;

  final IconData? icon;
  final bool? obscureText;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    var verificationFinal = !verification && controller.text.isNotEmpty;
    var defaultBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: verificationFinal
          ? const BorderSide(color: Colors.greenAccent)
          : const BorderSide(),
    );
    const errorBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide(color: Colors.red));
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: controller.text.isNotEmpty
                    ? !verification
                        ? Colors.red
                        : Colors.greenAccent
                    : Colors.black,
              )
            : null,
        border: border ?? defaultBorder,
        label: Text(label),
        constraints: constraints,
        errorText: verificationFinal ? errorText : null,
        errorBorder: verificationFinal ? errorBorder : null,
      ),
      controller: controller,
    );
  }
}
