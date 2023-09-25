import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                    'Full Name', 'John Mark', Icons.person_2_outlined),
                _buildTextInput('Email', 'example@domain.com', Icons.email),
                _buildTextInput('Phone Number', ' xxxxxxxxx', Icons.phone),
                _buildTextInput('Password', 'Password', Icons.visibility),
                _buildTextInput(
                    'Confirm Password', 'Password', Icons.visibility_off),
                _buildButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildButton() {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Next'),
          Icon(
            Icons.arrow_forward_ios,
          ),
        ]),
      ),
    );
  }

  _buildTextInput(String label, String hintText, IconData icon) {
    return Center(
      child: Container(
        height: 44,
        width: 295,
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: TextField(
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
                        child: Text("+ ${_selectedCountry.phoneCode}"),
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
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500,
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(1, 1))
        ],
        border: Border.all(
          color: Color.fromRGBO(221, 221, 221, 0.907),
        ),
        // borderRadius: BorderRadius.circular(radius)
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        "assets/logo.png",
        height: 100,
        width: 100,
      ),
    );
  }
}
