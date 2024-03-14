import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_divider/custom_divider.dart';
import 'package:gap/gap.dart';

class CustomCardWithHeader extends StatelessWidget {
  const CustomCardWithHeader({
    super.key,
    required this.header,
    required this.children,
    required this.divider,
    this.fontzise,
    this.fontweight = FontWeight.bold,
  });
  final String header;
  final Widget children;
  final CustomDivider divider;

  final double? fontzise;
  final FontWeight fontweight;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Column(
        children: [
          Text(
            header.toUpperCase(),
            style: TextStyle(
              fontSize: fontzise,
              fontWeight: fontweight,
            ),
          ),
          divider,
          const Gap(10.0),
          children,
        ],
      ),
    );
  }
}