import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.listLabel,
    required this.lengthList,
    this.constraints,
    required this.verification,
    required this.errorText,
    this.onChanged,
    this.ontap,
    this.readonly,
    this.obscureText,
    this.listIcon,
    this.border,
    this.valueList,
    this.type,
    this.suffixIcon,
    required this.listController,
    required this.breakpoint,
    required this.breakpointTitle,
    this.showIcon,
  });

  // Required Properties
  final List<String> listLabel;
  final int lengthList;
  final bool verification;
  final List<String> errorText;
  final BoxConstraints? constraints;
  final List<TextEditingController> listController;
  final List<int> breakpoint;
  final List<String> breakpointTitle;

  // Properties Optionals
  final Function(String)? onChanged;
  final List<String>? valueList;
  final void Function()? ontap;
  final List<IconData>? listIcon;
  final bool? readonly;
  final IconButton? suffixIcon;
  final bool? obscureText;
  final InputBorder? border;
  final List<TextInputType>? type;
  final List<bool>? showIcon;
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
              children: List.generate(
                breakpoint.length,
                (int index) {
                  // Seperate Label with Breakpoint
                  final breakpointLabel = index == 0
                      ? listLabel.getRange(0, breakpoint[index]).toList()
                      : listLabel
                          .getRange(breakpoint[index - 1], breakpoint[index])
                          .toList();

                  // Seperate Type with Breakpoint
                  final breakpointType = type == null
                      ? List.generate(
                          breakpointLabel.length, (index) => TextInputType.text)
                      : index == 0
                          ? type!.getRange(0, breakpoint[index]).toList()
                          : type!
                              .getRange(
                                  breakpoint[index - 1], breakpoint[index])
                              .toList();

                  // Seperate Controller with Breakpoint
                  final breakpointController = index == 0
                      ? listController.getRange(0, breakpoint[index]).toList()
                      : listController
                          .getRange(breakpoint[index - 1], breakpoint[index])
                          .toList();

                  final breakpointIcon = index == 0
                      ? listIcon!.getRange(0, breakpoint[index]).toList()
                      : listIcon!
                          .getRange(breakpoint[index - 1], breakpoint[index])
                          .toList();

                  final breakpointShowIcon = index == 0
                      ? showIcon!.getRange(0, breakpoint[index]).toList()
                      : showIcon!
                          .getRange(breakpoint[index - 1], breakpoint[index])
                          .toList();

                  // Default Constraint
                  var defaultConstraint = BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width >
                                400 && // Very Small Device
                            MediaQuery.of(context).size.width < 750
                        ? breakpointLabel.length > 3
                            ? MediaQuery.of(context).size.width /
                                (breakpointLabel.length - 3.6)
                            : MediaQuery.of(context).size.width /
                                (breakpointLabel.length - 0.6)
                        : MediaQuery.of(context).size.width >=
                                    730 && // Small Device
                                MediaQuery.of(context).size.width < 1100
                            ? breakpointLabel.length > 3
                                ? MediaQuery.of(context).size.width /
                                    (breakpointLabel.length - 2.6)
                                : MediaQuery.of(context).size.width /
                                    (breakpointLabel.length + 0.38)
                            : MediaQuery.of(context).size.width >=
                                        1100 && // Medium Device
                                    MediaQuery.of(context).size.width < 1500
                                ? breakpointLabel.length > 3
                                    ? MediaQuery.of(context).size.width /
                                        (breakpointLabel.length + 0.65)
                                    : MediaQuery.of(context).size.width /
                                        (breakpointLabel.length + 0.26)
                                : MediaQuery.of(context).size.width >=
                                        1500 // Large Device
                                    ? breakpointLabel.length > 3
                                        ? MediaQuery.of(context).size.width /
                                            (breakpointLabel.length + 0.5)
                                        : MediaQuery.of(context).size.width /
                                            (breakpointLabel.length + 0.2)
                                    : breakpointLabel.length >
                                            3 // Very Large Device
                                        ? MediaQuery.of(context).size.width /
                                            (breakpointLabel.length + 0.5)
                                        : MediaQuery.of(context).size.width /
                                            (breakpointLabel.length + 0.2),
                  );

                  // List Inside Expansion Tile
                  final List<Widget> list = List<Widget>.generate(
                    breakpointLabel.length,
                    (index) => TextFormField(
                      keyboardType: breakpointType[index],
                      inputFormatters:
                          breakpointType[index] == TextInputType.number
                              ? [FilteringTextInputFormatter.digitsOnly]
                              : [],
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
                        prefixIcon: breakpointShowIcon[index]
                            ? Icon(
                                breakpointController[index].text.isNotEmpty
                                    ? !verification
                                        ? breakpointIcon[index]
                                        : Icons.check
                                    : breakpointIcon[index],
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
                        constraints: constraints ?? defaultConstraint,
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
                            "Text Field ${breakpointLabel[index]} Value =  ${listController[index].text}");
                      },
                    ),
                  );

                  // Loop ExpansionTile
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
                      Align(
                        alignment: Alignment.center,
                        child: Wrap(
                          alignment: MediaQuery.of(context).size.width < 750
                              ? WrapAlignment.center
                              : WrapAlignment.start,
                          runSpacing: 8.0,
                          spacing: 8.0,
                          children: list,
                        ),
                      ),
                    ],
                  );

                  // Return the Widget
                  return customExpansionTile;
                },
              ),
            ),
          ),
        ));
  }
}
