import 'package:android_solution/methods/auth_methods.dart';
import 'package:android_solution/pages/verification_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  // @override
  // void initState() {
  //   super.initState();
  // }

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
            padding: const EdgeInsets.only(top: 100),
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
                _buildButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildButton() {
    return GestureDetector(
      onTap: signup,
      child: Container(
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
          onPressed: () {},
          child: loading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Next'),
                  Icon(
                    Icons.arrow_forward_ios,
                  ),
                ]),
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
      child: Image.asset(
        "assets/logo.png",
        height: 100,
        width: 100,
      ),
    );
  }
}
