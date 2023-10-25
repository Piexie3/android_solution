import 'package:android_solution/methods/auth_methods.dart';
import 'package:android_solution/pages/login_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool loading = false;

  
  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmController.dispose();
  }

  Country _selectedCountry = Country(
    phoneCode: "254",
    countryCode: "KE",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: '',
    example: '',
    displayName: '',
    displayNameNoCountryCode: '',
    e164Key: '',
  );
  void signup() async {
    print("...Clicked next button");
    setState(() {
      loading = true;
    });
    if (usernameController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        passwordController.text.isNotEmpty ||
        phoneController.text.isNotEmpty) {
      String res = await AuthMethods().signUpUser(
        username: usernameController.text,
        password: passwordController.text,
        email: emailController.text,
        phone: phoneController.text,
      );
      if (res == "success") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
      // print(res);
      SnackBar snackBar = SnackBar(
        content: Text(res),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLogo(),
                _buildTextInput(
                  'Full Name',
                  'John Mark',
                  Icons.person_2_outlined,
                  usernameController,
                ),
                _buildTextInput(
                  'Email',
                  'example@domain.com',
                  Icons.email,
                  emailController,
                ),
                _buildTextInput(
                  'Phone Number',
                  ' xxxxxxxxx',
                  Icons.phone,
                  phoneController,
                ),
                _buildTextInput(
                  'Password',
                  'Password',
                  Icons.visibility,
                  passwordController,
                ),
                _buildTextInput(
                  'Confirm Password',
                  'Password',
                  Icons.visibility_off,
                  confirmController,
                ),
                _buildButton(),
                _gotoSignup()
              ],
            ),
          ),
        ),
      ),
    );
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
            "Already have an account?",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            ),
            child: Text(
              "Login here",
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
        onPressed: signup,
        child: loading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SignUp'),
                  Icon(
                    Icons.arrow_forward_ios,
                  ),
                ],
              ),
      ),
    );
  }

  _buildTextInput(
    String label,
    String hintText,
    IconData icon,
    TextEditingController controller,
  ) {
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
          decoration: InputDecoration(
              hintText: hintText,
              label: Text(label),
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              prefix: label == "Phone Number"
                  ? GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: (Country selectedCountry) {
                            setState(() {
                              _selectedCountry = selectedCountry;
                            });
                          },
                          countryListTheme: CountryListThemeData(
                              bottomSheetHeight:
                                  MediaQuery.of(context).size.height * 0.7),
                        );
                      },
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("+ ${_selectedCountry.phoneCode}"),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    )
                  : SizedBox(),
              suffix: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Icon(
                  icon,
                  color: Colors.black,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ),
    );
  }

  _buildLogo() {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      child: Image.asset(
        "assets/logo.png",
        height: 100,
        width: 100,
      ),
    );
  }
}
