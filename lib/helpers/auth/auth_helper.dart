import 'package:get/get.dart';

class AuthHelper extends GetxController {
  var auth = {
    'email': '',
    'password': '',
    'token': '',
  }.obs;

  setAuth(name, value) {
    auth[name] = value;
  }
}
