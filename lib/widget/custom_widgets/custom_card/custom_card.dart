import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_divider/custom_divider.dart';

class CustomCardWithHeader extends StatelessWidget {
  const CustomCardWithHeader({
    super.key,
    required this.header,
    required this.children,
    required this.divider,
  });
  final String header;
  final Widget children;
  final CustomDivider divider;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Column(
        children: [
          Text(header),
          divider,
          children,
        ],
      ),
    );
  }
}
