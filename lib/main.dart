import 'package:flutter/material.dart';
import 'package:fynhelper/dash/dashboard.dart';
import 'package:fynhelper/home/home_page.dart';
import 'package:fynhelper/home/login_page.dart';
import 'package:fynhelper/home/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FynHelper",
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
