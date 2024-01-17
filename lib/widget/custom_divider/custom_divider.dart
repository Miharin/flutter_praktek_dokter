import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.space,
    this.color = Colors.black38,
    this.height,
    this.thickness = 1.0,
  });
  final double? space;
  final Color? color;
  final double? height;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: space,
      endIndent: space,
      color: color,
      height: height,
      thickness: thickness,
    );
  }
}
