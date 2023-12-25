import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthHelper extends GetxController {
  var auth = {
    'email': '',
    'password': '',
    'token': '',
  }.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
}
