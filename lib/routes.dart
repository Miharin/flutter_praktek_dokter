import 'package:flutter/material.dart';
import 'package:flutter_praktek_dokter/helpers/auth/auth_helper.dart';
import 'package:flutter_praktek_dokter/screens/auth/auth_screen.dart';
import 'package:flutter_praktek_dokter/screens/auth/login.dart';
import 'package:flutter_praktek_dokter/screens/auth/register.dart';
import 'package:flutter_praktek_dokter/screens/auth/table_data_patient.dart';
import 'package:flutter_praktek_dokter/screens/protected/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';

final AuthHelper _isUserLogin = Get.put(AuthHelper());

class Routes {
  List<GetPage<dynamic>> routes = [
    GetPage(
        name: '/',
        page: () {
          return StreamBuilder(
              stream: _isUserLogin.checkAuthState(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.hasData) {
                    _isUserLogin.userIsLogin.value = true;
                  } else {
                    _isUserLogin.userIsLogin.value = false;
                  }
                  return Obx(
                    () => CustomRoutes(
                      widget: DashboardScreen(),
                      isShowFirst: !_isUserLogin.userIsLogin.value,
                    ),
                  );
                }
              });
        }),
    GetPage(
      name: '/register',
      page: () => AuthScreen(
        title: 'Register Screen',
        child: RegisterScreen(),
      ),
    ),
    GetPage(
      name: '/test',
      page: () => AuthScreen(
        title: 'Register Screen',
        child: TableDataPatient(),
      ),
    ),
  ];
}

class CustomRoutes extends StatelessWidget {
  const CustomRoutes({
    super.key,
    required this.widget,
    required this.isShowFirst,
  });
  final Widget widget;
  final bool isShowFirst;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      layoutBuilder: (
        topChild,
        topChildKey,
        bottomChild,
        bottomChildKey,
      ) =>
          topChild,
      firstChild: AuthScreen(
        title: "Login Screen",
        child: LoginScreen(),
      ),
      secondChild: widget,
      crossFadeState:
          isShowFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 1000),
    );
  }
}
