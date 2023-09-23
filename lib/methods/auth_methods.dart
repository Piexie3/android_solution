import 'dart:convert';

import 'package:android_solution/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['openid'],
  );
  final FirebaseFirestore _firestore =  FirebaseFirestore.instance;

   Future<void> handleSignIn(String type) async {
    //1: Email

    //2: Google

    try {
      if (type == "google") {
        var user = await _googleSignIn.signIn();
        // print(user);
        if (user != null) {
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? 'assets/icons/feature-2.png';

          User userData = User();
          userData.avatar = photoUrl;
          userData.name = displayName;
          userData.email = email;
          userData.openid = id;
          userData.type = 2;
          print(jsonEncode(userData));
           await _firestore
            .collection("Users")
            .doc(userData.openid)
            .set(userData.toJson());
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
