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
    required this.breakpoint,
    required this.breakpointTitle,
  });

  // Required Properties
  final List<String> listLabel;
  final int lengthList;
  final bool verification;
  final List<String> errorText;
  final BoxConstraints constraints;
  final List<TextEditingController> listController;
  final List<int> breakpoint;
  final List<String> breakpointTitle;

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
              children: List.generate(
                breakpoint.length,
                (int index) {
                  final breakpointLabel = index == 0
                      ? listLabel.getRange(0, breakpoint[index]).toList()
                      : listLabel
                          .getRange(breakpoint[index - 1], breakpoint[index])
                          .toList();
                  final breakpointType = type == null
                      ? List.generate(
                          breakpointLabel.length, (index) => TextInputType.text)
                      : index == 0
                          ? type!.getRange(0, breakpoint[index]).toList()
                          : type!
                              .getRange(
                                  breakpoint[index - 1], breakpoint[index])
                              .toList();
                  final breakpointController = index == 0
                      ? listController.getRange(0, breakpoint[index]).toList()
                      : listController
                          .getRange(breakpoint[index - 1], breakpoint[index])
                          .toList();
                  final List<Widget> list = List<Widget>.generate(
                    breakpointLabel.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: breakpointType[index],
                        inputFormatters:
                            breakpointType[index] == TextInputType.number
                                ? [FilteringTextInputFormatter.digitsOnly]
                                : [],
                        onChanged: onChanged,
                        onTap: () async {
                          if (breakpointType[index] == TextInputType.datetime) {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                                initialDate: DateTime.now());
                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat.yMMMMd('in-in').format(pickedDate);
                              breakpointController[index].text = formattedDate;
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
                                  breakpointController[index].text.isNotEmpty
                                      ? !verification
                                          ? icon
                                          : Icons.check
                                      : icon,
                                  // If Text is Empty Set Colors to Black
                                  color: breakpointController[index]
                                          .text
                                          .isNotEmpty
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
                          label: Text(breakpointLabel[index]),
                          // If errorVerificationFinal == true then send errorText and error Border
                          errorText:
                              errorVerificationFinal ? errorText[index] : null,
                          errorBorder:
                              errorVerificationFinal ? errorBorder : null,
                        ),
                        controller: breakpointController[index],
                        onSaved: (String? value) {
                          debugPrint(
                              'Value for field ${breakpointLabel[index]} saved as "$value"');
                        },
                      ),
                    ),
                  );

                  final customExpansionTile = ExpansionTile(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    title: Center(
                      child: Text(
                        breakpointTitle[index].toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    children: [
                      const Divider(
                        indent: 20.0,
                        endIndent: 20.0,
                        color: Colors.black38,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: list,
                        ),
                      )
                    ],
                  );
                  return customExpansionTile;
                },
              ),
            ),
          ),
        ));
  }
}
