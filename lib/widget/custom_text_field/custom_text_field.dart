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

  // Required Properties
  final TextEditingController controller;
  final String label;
  final Function(String) onChanged;
  final bool verification;
  final String errorText;
  final BoxConstraints constraints;

  // Properties Optionals
  final IconData? icon;
  final bool? obscureText;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    // Verification Final Bool
    var errorVerificationFinal = !verification && controller.text.isNotEmpty;

    // Default Border
    const defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    );

    // Error Border
    const errorBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide(color: Colors.red));

    // Return
    return TextField(
      onChanged: onChanged,
      // If Obscure Text is Empty or Null Set Obscure Text to False
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        // if Icon is Empty Then Null
        prefixIcon: icon != null
            ? Icon(
                icon,
                // If Text is Empty Set Colors to Black
                color: controller.text.isNotEmpty
                    // If Verification == true then Colors set to Green
                    ? !verification
                        ? Colors.red
                        : Colors.greenAccent
                    : Colors.black,
              )
            : null,
        border: border ?? defaultBorder,
        label: Text(label),
        constraints: constraints,

        // If errorVerificationFinal == true then send errorText and error Border
        errorText: errorVerificationFinal ? errorText : null,
        errorBorder: errorVerificationFinal ? errorBorder : null,
      ),
      controller: controller,
    );
  }
}
