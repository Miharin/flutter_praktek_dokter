import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Login Page",
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: constraint.maxWidth > 500
                              ? 500
                              : constraint.maxWidth * 0.8),
                      child: const Divider(
                        indent: 3.0,
                        endIndent: 3.0,
                      ),
                    ),
                    const Gap(5.0),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_rounded),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          label: const Text("Email"),
                          constraints: BoxConstraints(
                              maxWidth: constraint.maxWidth > 500
                                  ? 500
                                  : constraint.maxWidth * 0.8)),
                    ),
                    const Gap(10.0),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_rounded),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          label: const Text("Password"),
                          constraints: BoxConstraints(
                              maxWidth: constraint.maxWidth > 500
                                  ? 500.0
                                  : constraint.maxWidth * 0.8)),
                    ),
                    const Gap(10.0),
                    FilledButton.icon(
                      label: const Text("Login"),
                      icon: const Icon(Icons.login_rounded),
                      style: FilledButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        fixedSize: constraint.maxWidth > 500.0
                            ? const Size(500.0, 50.0)
                            : Size(constraint.maxWidth * 0.8, 40.0),
                      ),
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            title: const Text("Please Input Token !"),
                            content: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.password_rounded),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  label: const Text("Token"),
                                  constraints: BoxConstraints(
                                      minWidth: constraint.maxWidth > 500
                                          ? 500.0
                                          : constraint.maxWidth * 0.8)),
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
                        );
                      },
                    ),
                  ]),
            ),
          ),
        );
      }),
    );
  }
}

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: 4.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
