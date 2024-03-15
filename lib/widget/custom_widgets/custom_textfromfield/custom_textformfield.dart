import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_praktek_dokter/helpers/auth/register_helper.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_drop_down/custom_drop_down.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.label,
    required this.verification,
    this.focusNode,
    this.validator,
    this.keyboardType,
    this.obscureText,
    this.readOnly,
    this.icon,
    this.suffixIcon,
    this.errorMessage,
    this.errorBorder,
    this.border,
    this.onSave,
  });

  final RegisterHelper _registerHelper = Get.put(RegisterHelper());

// Start Required Properties
  final String label;
  final bool verification;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
// End Required Properties

// Start Additional Properties

  // Define Use Which Keyboard Type, e.g Text, Number, Email
  final TextInputType? keyboardType;

  // Is Text Form Field is Password Related ?
  final bool? obscureText;

  // Is Text Form Field Read Only ?
  final bool? readOnly;

// Icon Properties

  // Icon Use Outside Text Form Field
  final IconData? icon;

  // Icon Inside Text Form Field
  final IconButton? suffixIcon;

// Error Properties

  // Error Hint
  final String? errorMessage;

  // Error Border
  final InputBorder? errorBorder;

  // Input Border if Any
  final InputBorder? border;

  // Default Border If border is Null
  final InputBorder defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(
      color: Colors.grey[300]!,
      width: 1.0,
    ),
  );

  // Error Border
  final defaultErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(
      color: Colors.red[300]!,
      width: 1.0,
    ),
  );

  // Function
  final Function(String?)? onSave;

  // End Additional Properties

  // Start Building Widget
  @override
  Widget build(BuildContext context) {
    // return Text Form Field
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 4.0, 8.0),
        child: keyboardType == TextInputType.streetAddress
            ? FutureBuilder(
                future: _registerHelper.getDataProvinces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CustomDropDown(
                      list: snapshot.data as List,
                      label: label,
                      verification: verification,
                      errorText: !verification ? errorMessage : null,
                      onSelected: onSave,
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                })
            : TextFormField(
                focusNode: focusNode,
                validator: validator,
                keyboardType: keyboardType ?? TextInputType.text,
                inputFormatters: keyboardType == TextInputType.number
                    ? [FilteringTextInputFormatter.digitsOnly]
                    : [],
                onChanged: onSave,
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
                      print(formattedDate);
                      // controller.text = formattedDate;
                    }
                  }
                },
                // If Obscure Text is Empty or Null Set Obscure Text to False
                obscureText: obscureText ?? false,
                readOnly: readOnly ?? false,
                decoration: InputDecoration(
                  // if Icon is Empty Then Null
                  prefixIcon: icon != null
                      ? Icon(
                          icon,
                          // If Text is Empty Set Colors to Black
                          color:
                              !verification ? Colors.red : Colors.greenAccent,
                        )
                      : null,
                  suffixIcon: suffixIcon,
                  border: border ?? defaultBorder,
                  label: Text(label),
                  // If errorVerificationFinal == true then send errorText and error Border
                  errorText: !verification ? errorMessage : null,
                  errorBorder:
                      !verification ? errorBorder ?? defaultErrorBorder : null,
                ),
                // controller: controller,
              ),
      ),
    );
  }
  // End Building Gadget
}
