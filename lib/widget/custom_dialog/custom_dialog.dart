import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.onChanged});
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Get.dialog(
          AlertDialog(
            title: const Text("Please Input Token !"),
            content: TextField(
              obscureText: true,
              onChanged: onChanged,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password_rounded),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  label: const Text("Token"),
                  constraints: BoxConstraints(
                      minWidth: constraints.maxWidth > 500
                          ? 500.0
                          : constraints.maxWidth * 0.8)),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Login"),
              ),
            ],
          ),
        ) as Widget;
      },
    );
  }
}
