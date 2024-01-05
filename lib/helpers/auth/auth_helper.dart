import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/models/user/authentication_model.dart';
import 'package:get/get.dart';

class AuthHelper extends GetxController {
  var auth = {
    'email': '',
    'password': '',
    'token': '',
  }.obs;

  var db = FirebaseFirestore.instance;

  var userIsLogin = false.obs;

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

        query.then((userData) {
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
    } catch (error) {
      debugPrint(error.toString());
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
