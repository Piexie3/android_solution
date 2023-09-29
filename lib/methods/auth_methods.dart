import 'dart:convert';
import 'package:android_solution/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:android_solution/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['openid'],
  );
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> handleSignIn(String type, BuildContext context) async {
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
          String photoUrl = user.photoUrl ?? 'https://images.unsplash.com/photo-1695527081793-91a2d4b5b103?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60';

          User userData = User();
          userData.avatar = photoUrl;
          userData.name = displayName;
          userData.email = email;
          userData.openid = id;
          userData.type = 2;
          // print(jsonEncode(userData));
          await _firestore
              .collection("Users")
              .doc(userData.openid)
              .set(userData.toJson());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
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
