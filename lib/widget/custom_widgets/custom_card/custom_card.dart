import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_divider/custom_divider.dart';
import 'package:gap/gap.dart';

class CustomCardWithHeader extends StatelessWidget {
  const CustomCardWithHeader({
    super.key,
    required this.header,
    required this.children,
    this.divider,
    this.fontsize,
    this.fontweight = FontWeight.bold,
  });
  final String header;
  final Widget children;
  final CustomDivider? divider;

  final double? fontsize;
  final FontWeight fontweight;

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      child: Column(
        children: [
          Text(
            header.toUpperCase(),
            style: TextStyle(
              fontSize: fontsize ?? 18.0,
              fontWeight: fontweight,
            ),
          ),
          divider ?? const CustomDivider(space: 20.0),
          const Gap(10.0),
          children,
        ],
      ),
    );
  }
}

class FlatCard extends StatelessWidget {
  const FlatCard({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey[200]!,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
