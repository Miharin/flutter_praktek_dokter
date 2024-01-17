import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomTextFormFieldTest extends StatelessWidget {
  const CustomTextFormFieldTest({
    super.key,
    required this.label,
    required this.controller,
    required this.verification,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.icon,
    this.suffixIcon,
    this.errorMessage = "",
    this.errorBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    this.border = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide(color: Colors.red),
    ),
    this.onSave,
  });

// Start Required Properties
  final String label;
  final TextEditingController controller;
  final bool verification;

// End Required Properties

// Start Additional Properties

  // Define Use Which Keyboard Type, e.g Text, Number, Email
  final TextInputType? keyboardType;

  // Is Text Form Field is Password Related ?
  final bool obscureText;

  // Is Text Form Field Read Only ?
  final bool readOnly;

// Icon Properties

  // Icon Use Outside Text Form Field
  final IconData? icon;

  // Icon Inside Text Form Field
  final IconData? suffixIcon;

// Error Properties

  // Error Hint
  final String? errorMessage;

  // Error Border
  final InputBorder? errorBorder;

  // Input Border if Any
  final InputBorder? border;

  // Function
  final Function(String?)? onSave;

  // End Additional Properties

  // Start Building Widget
  @override
  Widget build(BuildContext context) {
    // Search if Error Verification true or false
    bool errorVerification = !verification && controller.text.isNotEmpty;

    // return Text Form Field
    return TextFormField(
      keyboardType: keyboardType,
      inputFormatters: keyboardType == TextInputType.number
          ? [FilteringTextInputFormatter.digitsOnly]
          : [],
      // if Date Time onTap Popup Date Picker
      onTap: () async {
        if (keyboardType == TextInputType.datetime) {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              initialDate: DateTime.now());
          if (pickedDate != null) {
            String formattedDate =
                DateFormat.yMMMMd('in-in').format(pickedDate);
            controller.text = formattedDate;
          }
        }
      },
      // If Obscure Text is Empty or Null Set Obscure Text to False
      obscureText: obscureText,
      readOnly: readOnly,
      decoration: InputDecoration(
        // if Icon is Empty Then Null
        prefixIcon: icon != null
            ? Icon(
                controller.text.isNotEmpty
                    ? !verification
                        ? icon
                        : Icons.check
                    : icon,
                // If Text is Empty Set Colors to Black
                color: controller.text.isNotEmpty
                    // If Verification == true then Colors set to Green
                    ? !verification
                        ? Colors.red
                        : Colors.greenAccent
                    : Colors.black,
              )
            : null,
        suffixIcon: Icon(suffixIcon),
        border: border,
        label: Text(label),
        // If errorVerificationFinal == true then send errorText and error Border
        errorText: errorVerification ? errorMessage : null,
        errorBorder: errorVerification ? errorBorder : null,
      ),
      controller: controller,
      onSaved: onSave,
    );
  }
  // End Building Gadget
}