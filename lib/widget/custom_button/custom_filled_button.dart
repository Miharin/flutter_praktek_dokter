import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton(
      {super.key, this.icon, required this.label, this.width, this.onPressed});
  final Icon? icon;
  final String label;
  final Size? width;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? FilledButton.icon(
            label: Text(label),
            icon: icon!,
            style: FilledButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              fixedSize: width,
            ),
            onPressed: onPressed,
          )
        : FilledButton(
            style: FilledButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              fixedSize: width,
            ),
            onPressed: onPressed,
            child: Text(label),
          );
  }
}
