import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fynhelper/dash/dashboard.dart';
import 'package:fynhelper/home/home_page.dart';
import 'package:fynhelper/home/login_page.dart';
import 'package:fynhelper/home/signup_page.dart';
import 'package:fynhelper/providers/exxpense_provider.dart';
import 'package:fynhelper/sidebar_pages/about_us.dart';
import 'package:fynhelper/sidebar_pages/my_account.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ExpenseProvider(),
      child: const MyApp(),
    ),
  );
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
        '/about': (context) => AboutUs(),
        '/account': (context) => MyAccount(),
      },
    );
  }
}
