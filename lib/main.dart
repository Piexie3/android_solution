import 'package:android_solution/pages/application.dart';
import 'package:android_solution/pages/home_screen.dart';
import 'package:android_solution/pages/login_screen.dart';
import 'package:android_solution/pages/welcome_screen.dart';
import 'package:android_solution/src/auth/presentation/login/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: LoginScreen(),
      ),
    );
  }
}
