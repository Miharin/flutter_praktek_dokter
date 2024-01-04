import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  setAuth(name, value, isValid) {
    auth[name] = value;
    if (name == "email") {
      isValid
          ? emailVerification.value = true
          : emailVerification.value = false;
    } else if (name == "password") {
      isValid
          ? passwordVerification.value = true
          : passwordVerification.value = false;
    } else {
      isValid
          ? tokenVerification.value = true
          : tokenVerification.value = false;
    }
    if (emailVerification.value && passwordVerification.value) {
      disabledLoginButton.value = false;
    } else {
      disabledLoginButton.value = true;
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
        final query = users.doc(userCredential.user?.uid).get();

        try {
          await query.then((userData) {
            final data = userData.data() as Map<String, dynamic>;
            userIsLogin.value = data['token'] == auth['token'] ? true : false;
            userIsLogin.value
                ? Get.snackbar("Login Success", data['email'])
                : null;
          });
        } catch (e) {
          debugPrint("Error getting document: $e");
        }
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
