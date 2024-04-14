import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_praktek_dokter/helpers/auth/auth_helper.dart';
import 'package:flutter_praktek_dokter/screens/protected/protected_screen.dart';
import 'package:flutter_praktek_dokter/widget/custom_widgets/custom_button/custom_filled_button.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final AuthHelper _isUserLogin = Get.put(AuthHelper());
  final MyDrawerController _myDrawer = Get.put(MyDrawerController());

  @override
  Widget build(BuildContext context) {
    return ProtectedScreen(
      title: "Dashboard Screen",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ZoomDrawer(
          controller: _myDrawer.zoomDrawerController,
          borderRadius: 24.0,
          showShadow: false,
          angle: 0.0,
          drawerShadowsBackgroundColor: Colors.grey[300]!,
          slideWidth: MediaQuery.of(context).size.width * 0.5,
          menuScreen: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[300]!,
                width: 0.2,
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: CustomFilledButton(
                      label: "Toggle Drawer",
                      onPressed: _myDrawer.toggleDrawer,
                    ),
                  ),
                  Flexible(
                    child: CustomFilledButton(
                      label: "Logout",
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        _isUserLogin.userIsLogin.value = false;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          mainScreen: Container(
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: CustomFilledButton(
                    label: "Toggle Drawer",
                    onPressed: _myDrawer.toggleDrawer,
                  ),
                ),
                Flexible(
                  child: CustomFilledButton(
                    label: "Logout",
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      _isUserLogin.userIsLogin.value = false;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }
}
