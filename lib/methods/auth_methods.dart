import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['openid'],
  );

   Future<void> handleSignIn(String type) async {
    //1: Email

    //2: Google

    try {
      if (type == "google") {
        var user = await _googleSignIn.signIn();
        // print(user);
        if (user != null) {
          final _gAuthentication = await user.authentication;
          final _credentials = await GoogleAuthProvider.credential(
            idToken: _gAuthentication.idToken,
            accessToken: _gAuthentication.accessToken,
          );

          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? 'assets/icons/feature-2.png';

          LoginRequestEntity userData = LoginRequestEntity();
          userData.avatar = photoUrl;
          userData.name = displayName;
          userData.email = email;
          userData.openid = id;
          userData.type = 2;
          print(jsonEncode(userData));
          asyncPostAllData(userData);
        }
      } else if (type == "facebook") {
        if (kDebugMode) {
          print("...error in login with facebook");
        }
      } else if (type == "apple") {
        if (kDebugMode) {
          print("...error in login with apple");
        }
      } else if (type == "phone number") {
        if (kDebugMode) {
          print("...error in login with phone number");
        }
      }
    } catch (e) {
      // if (kDebugMode) {
      print("...error in login ${e.toString()}");
      // }
    }
    //3: Facebook
    //4: Apple
    //5: Phone
  }

}
