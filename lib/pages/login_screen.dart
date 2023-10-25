import 'package:android_solution/methods/auth_methods.dart';
import 'package:android_solution/pages/home_screen.dart';
import 'package:android_solution/pages/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController psw = TextEditingController();

  bool _isLoading = false;

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: email.text,
      password: psw.text,
    );

    if (res == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Error: ${res}",
          ),
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 100),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogo(),
            _buildTextInput(
                'Email', 'example@domain.com', Icons.email, email, false),
            _buildTextInput('Password', "", Icons.visibility, psw, true),
            _buildButton(),
            _gotoSignup()
          ],
        ),
      ),
    ));
  }

  _gotoSignup() {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You Don't have an account?",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => SignupScreen(),
              ),
            ),
            child: Text(
              "Signup here",
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
          ),
        ],
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
        onPressed: loginUser,
        child: _isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('LogIn'),
                  Icon(
                    Icons.arrow_forward_ios,
                  ),
                ],
              ),
      ),
    );
  }

  _buildLogo() {
    return Container(
      child: Image.asset(
        "assets/logo.png",
        height: 100,
        width: 100,
      ),
    );
  }

  _buildTextInput(String label, String hintText, IconData icon,
      TextEditingController controller, bool ispassword) {
    return Center(
      child: Container(
        height: 44,
        width: 295,
        margin: EdgeInsets.only(
          top: 10,
        ),decoration: BoxDecoration(
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
        child: TextField(
          controller: controller,
          maxLines: 1,
          obscureText: ispassword,
          
          decoration: InputDecoration(
            
            hintText: hintText,
            label: Text(label),
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            suffix: Padding(
              padding: EdgeInsets.only(top: 4),
              child: Icon(
                icon,
                color: Colors.black,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
