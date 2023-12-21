import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_praktek_dokter/screens/auth/auth_sceen.dart';
import 'package:get/get.dart';

import 'package:flutter_praktek_dokter/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Selamat Datang di Praktek Dokter App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/', page: () => const AuthScreen()),
      ],
      home: const AuthScreen(),
    );
  }
}
