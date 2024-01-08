import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.listLabel,
    required this.lengthList,
    required this.constraints,
    required this.verification,
    required this.errorText,
    this.onChanged,
    this.ontap,
    this.readonly,
    this.obscureText,
    this.icon,
    this.border,
    this.type,
    this.suffixIcon,
    required this.listController,
  });

  // Required Properties
  final List<String> listLabel;
  final int lengthList;
  final bool verification;
  final String errorText;
  final BoxConstraints constraints;
  final List<TextEditingController> listController;

  // Properties Optionals
  final Function(String)? onChanged;
  final void Function()? ontap;
  final IconData? icon;
  final bool? readonly;
  final IconButton? suffixIcon;
  final bool? obscureText;
  final InputBorder? border;
  final List<TextInputType>? type;
  @override
  Widget build(BuildContext context) {
    // Verification Final Bool
    var errorVerificationFinal =
        !verification && TextEditingController().text.isNotEmpty;

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

    //Return
    return Shortcuts(
        shortcuts: const <ShortcutActivator, Intent>{
          SingleActivator(LogicalKeyboardKey.space): NextFocusIntent(),
        },
        child: FocusTraversalGroup(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            onChanged: () {
              Form.of(primaryFocus!.context!).save();
            },
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: List<Widget>.generate(
                (lengthList),
                (int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: type?[index] ?? TextInputType.text,
                      inputFormatters: type?[index] == TextInputType.number
                          ? [FilteringTextInputFormatter.digitsOnly]
                          : [],
                      onChanged: onChanged,
                      onTap: () async {
                        if (type?[index] == TextInputType.datetime) {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              initialDate: DateTime.now());
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat.yMMMMd('in-in').format(pickedDate);
                            listController[index].text = formattedDate;
                          }
                        }
                      },
                      // If Obscure Text is Empty or Null Set Obscure Text to False
                      obscureText: obscureText ?? false,
                      readOnly: readonly ?? false,
                      decoration: InputDecoration(
                        // if Icon is Empty Then Null
                        prefixIcon: icon != null
                            ? Icon(
                                listController[index].text.isNotEmpty
                                    ? !verification
                                        ? icon
                                        : Icons.check
                                    : icon,
                                // If Text is Empty Set Colors to Black
                                color: listController[index].text.isNotEmpty
                                    // If Verification == true then Colors set to Green
                                    ? !verification
                                        ? Colors.red
                                        : Colors.greenAccent
                                    : Colors.black,
                              )
                            : null,
                        suffixIcon: suffixIcon,
                        border: border ?? defaultBorder,
                        constraints: constraints,
                        label: Text(listLabel[index]),
                        // If errorVerificationFinal == true then send errorText and error Border
                        errorText: errorVerificationFinal ? errorText : null,
                        errorBorder:
                            errorVerificationFinal ? errorBorder : null,
                      ),
                      controller: listController[index],
                      onSaved: (String? value) {
                        debugPrint(
                            'Value for field ${listLabel[index]} saved as "$value"');
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
