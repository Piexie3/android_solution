import 'package:android_solution/methods/auth_methods.dart';
import 'package:android_solution/pages/login_screen.dart';
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
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Center(
          child: Column(
              children: [
                Text("Home Screen"),
                _buildButton(),
              ],
            ),
        ),
      ),
      
    );
  }

  _buildButton() {
    return Container(
      width: 295,
      height: 44,
      margin: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 151, 151, 151),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: logout,
        child: _isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Logout'),
                  Icon(
                    Icons.arrow_forward_ios,
                  ),
                ],
              ),
      ),
    );
  }
}
