
import 'package:android_solution/pages/verification_screen.dart';
import 'package:android_solution/pages/welcome_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      themeMode: ThemeMode.light
    );
  }
}

