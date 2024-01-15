import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/widget/custom_text_field/custom_text_field.dart';
import 'package:gap/gap.dart';

class RegisterV3 extends StatelessWidget {
  RegisterV3({super.key});

  get controler => TextEditingController();

  get verification => true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      // Constrained For Text Field
      var constrained = BoxConstraints(
        maxWidth: constraint.maxWidth > 500 ? 500 : constraint.maxWidth / 3,
        minWidth: constraint.maxWidth > 500 ? 500 : constraint.maxWidth / 3,
      );

      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Gap(100.0),
                  ExpansionTile(
                    shape: const RoundedRectangleBorder(),
                    title: Text(
                      "Register".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      Column(
                        children: [
                          const Gap(10.0),
                          const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(
                            color: Colors.black38,
                            indent: 30,
                            endIndent: 30,
                          ),
                          const Gap(10.0),
                          CustomTextField(
                            label: 'NIK',
                            constraints: constrained,
                            controller: controler,
                            verification: verification,
                            errorText: 'NIK',
                          ),
                          const Gap(10.0),
                          const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(
                            color: Colors.black38,
                            indent: 30,
                            endIndent: 30,
                          ),
                          const Gap(10.0),
                          CustomTextField(
                            label: 'Tempat Lahir',
                            constraints: constrained,
                            controller: controler,
                            verification: verification,
                            errorText: 'Tempat Lahir',
                          ),
                          const Gap(10.0),
                          const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(
                            color: Colors.black38,
                            indent: 30,
                            endIndent: 30,
                          ),
                          const Gap(10.0),
                          CustomTextField(
                            label: 'RT',
                            constraints: constrained,
                            controller: controler,
                            verification: verification,
                            errorText: 'RT',
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
