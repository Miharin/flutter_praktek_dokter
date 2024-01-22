import 'package:flutter/material.dart';

import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_appbar/custom_appbar.dart';

class ProtectedScreen extends StatelessWidget {
  const ProtectedScreen({super.key, required this.child, required this.title});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: title,
      ),
      body: child,
    );
  }
}
