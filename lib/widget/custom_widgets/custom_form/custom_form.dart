import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    required this.trigger,
    required this.child,
  });

  final LogicalKeyboardKey trigger;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        SingleActivator(trigger): const NextFocusIntent()
      },
      child: FocusTraversalGroup(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () => Form.of(primaryFocus!.context!).save(),
          child: child,
        ),
      ),
    );
  }
}
