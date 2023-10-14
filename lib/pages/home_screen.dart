import 'package:android_solution/methods/auth_methods.dart';
import 'package:android_solution/pages/login_screen.dart';
import 'package:android_solution/utils/block_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  void logout() async {
    setState(() {
      _isLoading = true;
    });
    await AuthMethods().signOut();
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Container(
          // height: 180,
          child: ListView.builder(
            itemBuilder: (child, index) => BlockCard(),
            itemCount: 12,
          ),
        ),
      ),
    );
  }
}
