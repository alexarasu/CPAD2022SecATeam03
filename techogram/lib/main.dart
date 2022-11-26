import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:techogram/responsive/mobile_screen_layout.dart';
import 'package:techogram/responsive/responsive_layout_screen.dart';
import 'package:techogram/responsive/web_screen_layout.dart';
import 'package:techogram/screens/login_screen.dart';
import 'package:techogram/screens/signup_screen.dart';
import 'package:techogram/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDhQQ_su-ViShN1UOrL48eTdEIssrVTgn0",
        appId: "1:337978442231:web:9fa57b8a0eae190b3aeef2",
        messagingSenderId: "337978442231",
        projectId: "techogram-20226",
        storageBucket: "techogram-20226.appspot.com",
      ),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Techogram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: webBackgroundColor,
      ),
      // home: ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: SignUpScreen(),
      //home: LoginScreen(),
    );
  }
}
