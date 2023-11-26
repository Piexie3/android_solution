import 'package:android_solution/src/auth/domain/repositories/auth_repository.dart';
import 'package:android_solution/src/auth/domain/models/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<String> createUser({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
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

  @override
  Future<String> loginUser({
    required String email,
    required String password,
  }) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }
  
  @override
  Future<List<model.User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
