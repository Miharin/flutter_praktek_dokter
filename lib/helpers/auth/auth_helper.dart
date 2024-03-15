import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/models/user/authentication_model.dart';
import 'package:get/get.dart';

class AuthData {
  final String email;
  final String password;
  final String token;

  AuthData({
    required this.email,
    required this.password,
    required this.token,
  });
}

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
  final FocusNode focusPassword = FocusNode();
  final RxMap<String, dynamic> authData = {
    "email": "",
    "password": "",
    "token": "",
  }.obs;

  final RxMap<String, bool> verificationData = {
    "email": false,
    "password": false,
    "token": false,
  }.obs;

  final RxBool disabledSignInButton = true.obs;

  void handleSignInButton() {
    if (verificationData["email"] == true &&
        verificationData["password"] == true) {
      disabledSignInButton.value = false;
    } else {
      disabledLoginButton.value = true;
    }
  }

  void handleLoginTextFormFieldChanged(name, value) {
    authData[name] = value;
    print(authData);
  }

  void handleVerification(name, verification) {
    verificationData[name] = !verification;
  }

  final RxList<AuthField> loginList = [
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

  final RxList<AuthField> tokenList = [
    AuthField(
      id: "token",
      label: "Token",
      obscureText: true,
      icon: Icons.password_rounded,
      showIcon: true,
      controller: TextEditingController(),
      errorMessage: "Token Wajib Diisi dan Minimat Terdiri dari 10 Digit",
    ),
  ].obs;

  var db = FirebaseFirestore.instance;

  var userIsLogin = false.obs;

  final List<TextEditingController> controllers =
      List.generate(3, (index) => TextEditingController()).toList();

  var emailVerification = false.obs;
  var passwordVerification = false.obs;
  var tokenVerification = false.obs;
  var disabledLoginButton = true.obs;
  var disabledTokenButton = true.obs;

  var showPassword = false.obs;
  var showToken = false.obs;

  toggleObscure(AuthField field) {
    field.obscureText = !field.obscureText;
    loginList.refresh();
  }

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

  setAuth(name, value) {
    authData[name] = value;

    switch (name) {
      case "email":
        value
            ? emailVerification.value = true
            : emailVerification.value = false;
        break;
      case "password":
        value.length > 8
            ? passwordVerification.value = true
            : passwordVerification.value = false;
        break;
      case "token":
        value
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
        email: loginList[0].controller.text,
        password: loginList[1].controller.text,
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
          if (user.token == authData["token"]) {
            userIsLogin.value = true;
            Get.snackbar(
              "Login Success",
              "Welcome ${user.username}",
              backgroundColor: Colors.white,
            );
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
}
