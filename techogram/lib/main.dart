import 'package:flutter/material.dart';
import 'package:techogram/features/auth/screens/login_screen.dart';
import 'package:techogram/theme/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Pallete.darkModeAppTheme,
      // home: const SizedBox(),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
