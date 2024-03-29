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

class AuthHelper extends GetxController {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final formKeyLogin = GlobalKey<FormState>().obs;
  final formKeyToken = GlobalKey<FormState>().obs;
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final RxMap<String, dynamic> authData = {
    "email": "",
    "password": "",
    "token": "",
  }.obs;

  final RxMap<String, bool> obscureText = {
    "password": true,
    "token": true,
  }.obs;

  final RxMap<String, bool> verificationData = {
    "email": false,
    "password": false,
    "token": false,
  }.obs;

  final RxBool disabledSignInButton = true.obs;
  final RxBool disabledTokenButton = true.obs;
  final RxBool userIsLogin = false.obs;

  void handleSignInButton() {
    if (verificationData["email"]! && verificationData["password"]!) {
      disabledSignInButton.value = false;
    } else {
      disabledSignInButton.value = true;
    }
  }

  void handleTokenButton() {
    if (verificationData["token"]!) {
      disabledTokenButton.value = false;
    } else {
      disabledTokenButton.value = true;
    }
  }

  void handleLoginTextFormFieldChanged(name, value) => authData[name] = value;

  validatorLogIn(String? name, String? value) {
    if (value!.isNotEmpty) {
      switch (name) {
        case "email":
          if (!value.isEmail) {
            handleVerification(name, verificationData[name], false);
            return "Email Tidak Sesuai Format";
          } else {
            handleVerification(name, verificationData[name], true);
          }
          break;
        case "password":
          if (value.length < 8) {
            handleVerification(name, verificationData[name], false);
            return "Password Wajib Diisi dan Minimal Terdiri dari 8 Digit";
          } else {
            handleVerification(name, verificationData[name], true);
          }
          break;
        case "token":
          if (value.length < 10) {
            handleVerification(name, verificationData[name], false);
            return "Token Wajib Diisi dan Minimal Terdiri dari 10 Digit";
          } else {
            handleVerification(name, verificationData[name], true);
          }
          break;
        default:
      }
    }
  }

  void handleVerification(name, verification, value) {
    verificationData[name] = value;
    verificationData.refresh();
    handleSignInButton();
    handleTokenButton();
  }

  void handleObscureText(name) {
    obscureText[name] = !obscureText[name]!;
    obscureText.refresh();
  }

  Stream<User?> checkAuthState() {
    return FirebaseAuth.instance.authStateChanges();
  }

  checkIsUserLogin(uid) async {
    final users = db.collection("Users");
    final query = users.doc(uid).get();

    await query.then((userData) async {
      final data = userData.data()!;

      if (data.isNotEmpty) {
        userIsLogin.value = true;
      } else {
        userIsLogin.value = false;
      }
    });
  }

  void signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: authData["email"],
        password: authData["password"],
      )
          .then((userCredential) async {
        final users = db.collection("Users");
        final query = users.doc(userCredential.user!.uid).get();

        await query.then((userData) async {
          // Catch if User Data if Empty

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
