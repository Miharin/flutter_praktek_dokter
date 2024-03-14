import 'package:flutter/material.dart';

class CustomFlatTextButton extends StatelessWidget {
  const CustomFlatTextButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.transparent;
          }
          return Colors.transparent;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return Theme.of(context).colorScheme.secondary;
          }
          return Theme.of(context).primaryColor;
        }),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
