import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_textfromfield/custom_textformfield.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterPatient extends StatelessWidget {
  const RegisterPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          children: [
            Card(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CustomTextFormField(
                          label: "Nama Lengkap",
                          verification: true,
                          onSave: (value) => print(value),
                        ),
                        CustomTextFormField(
                          label: "ID",
                          verification: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.146,
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => {},
                        label: const Text("ADD NEW LIST"),
                        icon: const Icon(Icons.add),
                      ),
                      const Gap(10.0),
                      ElevatedButton.icon(
                        onPressed: () => Get.toNamed('/test'),
                        label: const Text("Back"),
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
