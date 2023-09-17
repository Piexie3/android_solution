import 'package:android_solution/pages/verification_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Container(
            child: Column(
          children: [
            _buildLogo(),
            _buildThirdPartySignUp("Google", "google"),
            _buildThirdPartySignUp("Apple", "apple"),
            _buildThirdPartySignUp('Facebook', "facebook"),
            _buildOrEidget(),
            _buildThirdPartySignUp('Email and Password', ""),
            _buildLoginText(),
          ],
        )),
      ),
    );
  }

  _buildLoginText() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
      child: Column(
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: "Robonto",
            ),
          ),
          GestureDetector(
            onTap: () {
              print("...Go to login Screen");
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VerificationScreen(),
                ),
              );
            },
            child: Text(
              "Login here",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          )
        ],
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

  _buildOrEidget() {
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 30),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: 2,
            ),
          ),
          Text(
            "  or   ",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Expanded(
              child: Divider(
            height: 2,
          ))
        ],
      ),
    );
  }

  _buildThirdPartySignUp(String loginType, String logo) {
    return InkWell(
      onTap: () {
        print("...signup with $loginType");
      },
      splashColor: Colors.green,
      child: Container(
        height: 44,
        width: 295,
        margin: const EdgeInsets.all(10),
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
            ]),
        child: Container(
          child: Row(
            mainAxisAlignment:
                logo == "" ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              logo == ""
                  ? const SizedBox()
                  : Container(
                      height: 32,
                      padding: EdgeInsets.only(
                        left: 40,
                        right: 30,
                      ),
                      child: Image.asset(
                        'assets/$logo.png',
                        height: 32,
                        width: 32,
                      ),
                    ),
              Text(
                "Sign in with $loginType",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: "Robonto"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
