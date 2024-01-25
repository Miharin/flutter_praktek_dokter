import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/models/user/authentication_model.dart';
import 'package:get/get.dart';

class AuthField {
  final String id;
  final String label;
  bool obscureText;
  final TextEditingController controller;
  final TextInputType type;
  RxBool verification;
  final String errorMessage;
  final IconData? icon;
  final Function(String?)? onSave;
  final bool showIcon;

  AuthField({
    required this.id,
    required this.label,
    required this.controller,
    this.onSave,
    this.obscureText = false,
    this.errorMessage = "",
    this.icon,
    this.type = TextInputType.text,
    this.showIcon = false,
  }) : verification = false.obs;
}

class AuthHelper extends GetxController {
  final List<AuthField> loginList = [
    AuthField(
      id: "email",
      label: "Email",
      icon: Icons.email_rounded,
      showIcon: true,
      controller: TextEditingController(),
      errorMessage: "Email Tidak Sesuai Format",
    ),
    AuthField(
      id: "password",
      label: "Password",
      obscureText: true,
      icon: Icons.lock_rounded,
      showIcon: true,
      controller: TextEditingController(),
      errorMessage: "Password Wajib Diisi dan Minimal Terdiri dari 8 Digit",
    ),
  ].obs;
  var auth = {
    'email': '',
    'password': '',
    'token': '',
  }.obs;

  var db = FirebaseFirestore.instance;

  var userIsLogin = false.obs;

  final List<TextEditingController> controllers =
      List.generate(3, (index) => TextEditingController()).toList();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();

  var emailVerification = false.obs;
  var passwordVerification = false.obs;
  var tokenVerification = false.obs;
  var disabledLoginButton = true.obs;
  var disabledTokenButton = true.obs;

  var showPassword = false.obs;
  var showToken = false.obs;

  showPasswordToggle() {
    showPassword.value = !showPassword.value;
    for (var login in loginList) {
      if (login.id == "password") {
        login.obscureText = !login.obscureText;
      }
    }
  }

  showTokenToggle() {
    showToken.value = !showToken.value;
  }

  setAuth(name, value, isValid) {
    auth[name] = value;
    switch (name) {
      case "email":
        isValid
            ? emailVerification.value = true
            : emailVerification.value = false;
        break;
      case "password":
        isValid
            ? passwordVerification.value = true
            : passwordVerification.value = false;
        break;
      case "token":
        isValid
            ? tokenVerification.value = true
            : tokenVerification.value = false;
      default:
    }
    if (emailVerification.value && passwordVerification.value) {
      disabledLoginButton.value = false;
    } else {
      disabledLoginButton.value = true;
    }

    if (tokenVerification.value) {
      disabledTokenButton.value = false;
    } else {
      disabledTokenButton.value = true;
    }
  }

  Stream<User?> checkAuthState() {
    return FirebaseAuth.instance.authStateChanges();
  }

  void signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: auth['email']!,
        password: auth['password']!,
      )
          .then((userCredential) async {
        final users = db.collection("Users");
        final query = users.doc(userCredential.user!.uid).get();

        await query.then((userData) async {
          // Catch if User Data if Empty
          print(userData);

          // If UserData is Not Empty Next();
          final data = userData.data()!;
          final user = AuthenticationModel.fromJson(data);
          if (user.token == auth["token"]) {
            userIsLogin.value = true;
            Get.snackbar(
              "Login Success",
              "Welcome ${user.username}",
              backgroundColor: Colors.white,
            );
            emailController.clear();
            passwordController.clear();
            tokenController.clear();
          }
        });
      });
    } on FirebaseAuthException catch (error) {
      if (error.code == "user-not-found") {
        print("No User Friend for That Email !");
      } else if (error.code == 'wrong-password') {
        print("Wrong Password Provided for That User !");
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    tokenController.dispose();
    super.dispose();
  }
}
