import 'package:android_solution/models/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String username,
    required String password,
    required String email,
    required String phone,
  }) async {
    String res = "Unexpected Error Occurred";
    try {
      UserCredential userCred = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      model.User user = model.User(
        username: username,
        age: "",
        bio: "",
        email: email,
        gender: "",
        id: userCred.user!.uid,
        location: "",
        phone: phone,
        profilepic: "",
        followers: [],
        following: [],
      );

      _db.collection("Users").doc(userCred.user!.uid).set(user.toJson());
      String res = "Success";
      return res;
    } catch (e) {
      String res = "Error: ${e.toString()}";
      return res;
    }
  }

  //loging in a user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "unknown error occurred";
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
