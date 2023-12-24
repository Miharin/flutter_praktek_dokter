import 'package:flutter_praktek_dokter/screens/auth/auth_screen.dart';
import 'package:flutter_praktek_dokter/screens/auth/login.dart';
import 'package:flutter_praktek_dokter/screens/auth/register.dart';
import 'package:get/get.dart';

class Routes {
  List<GetPage<dynamic>> routes = [
    GetPage(
      name: '/',
      page: () => AuthScreen(
        title: 'Login Screen',
        child: LoginScreen(),
      ),
    ),
    GetPage(
      name: '/register',
      page: () => const AuthScreen(
        title: 'Register Screen',
        child: RegisterScreen(),
      ),
    ),
  ];
}
