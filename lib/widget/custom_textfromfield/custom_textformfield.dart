import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField(
      {super.key, required this.listLabel, required this.lengthList});

  final List<String> listLabel;
  final int lengthList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shortcuts(
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
            children: List<Widget>.generate((lengthList), (int index) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text(listLabel[index]),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    onSaved: (String? value) {
                      debugPrint('Value for field $index saved as "$value');
                    },
                  ));
            }),
          ),
        )),
      ),
    );
  }
}
