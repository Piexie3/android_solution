import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String age;
  final String bio;
  final String email;
  final String gender;
  final String id;
  final String location;
  final String phone;
  final String profilepic;
  final List followers;
  final List following;
  User({
    required this.username,
     required this.age,
     required this.bio,
     required this.email,
     required this.gender,
     required this.id,
     required this.location,
     required this.phone,
     required this.profilepic,
     required this.followers,
     required this.following,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "age": age,
        "email": email,
        "gender": gender,
        "id": id,
        "location": location,
        "bio":bio,
        "phone": phone,
        "profilepic": profilepic,
        "followers": followers,
        "following": following,
      };

  static User fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return User(
      email: snap['email'],
      id: snap['id'],
      profilepic: snap['profilepic'],
      username: snap['username'],
      bio: snap['bio'],
      followers: snap['followers'],
      following: snap['following'],
      gender: snap['gender'],
      location: snap['location'],
      age: snap['age'],
      phone: snap['phone'],
    );
  }
}
