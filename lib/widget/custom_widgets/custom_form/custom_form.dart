import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomForm extends StatelessWidget {
  CustomForm({
    super.key,
    required this.child,
    this.onChanged,
  });
  final _controller = Get.put(CustomFormState());
  final Widget child;
  final void Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: _controller._formkey.value,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        child: child,
      ),
    );
  }
}

class CustomFormState extends GetxController {
  final _formkey = GlobalKey<FormState>().obs;
}
