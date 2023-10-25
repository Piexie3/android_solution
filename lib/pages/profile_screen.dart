import 'dart:ffi';

import 'package:android_solution/methods/auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back_ios,
          ),
          title: Container(
            child: Row(
              children: [
                Text(
                  "codefive",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.verified_outlined,
                  color: Colors.blue,
                )
              ],
            ),
          ),
          actions: [
            Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            GestureDetector(
              onTap: ()=>AuthMethods().signOut(),
              child: Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
            ),
          ],
          toolbarHeight: 20,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Account(),
              AccountDetails(),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                        ,boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 2,
                          )
                        ]
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          print("... Follow clicked...");
                        },
                        child: Text("Follow"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class AccountDetails extends StatelessWidget {
  const AccountDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Codefive",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Android developer",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "Intrested in Coding",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
          // Container(
          //   child: Stack(
          //     children: [
          //       Positioned(
          //         left: 0,
          //         child: CircleAvatar(
          //           radius: 20,
          //         ),
          //       ),
          //       Positioned(
          //         left: 20,
          //         child: CircleAvatar(radius: 20,),
          //       ),
          //       Positioned(
          //         left: 40,
          //         child: CircleAvatar(radius: 20,),
          //       ),
          //     ],
          //   ),
          // )
          Text.rich(
            TextSpan(
              text: "Followed by",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
              children: [
                TextSpan(
                  text: " Joram",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: ","),
                TextSpan(
                  text: " Benta",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: ","),
                TextSpan(
                  text: " Jao Felix",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Account extends StatelessWidget {
  const Account({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // Container(height: 80,width: 80,decoration: BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: AssetImage("assets/profile.jpg"))),),
          Container(
            height: 80,width: 80,decoration: BoxDecoration(shape: BoxShape.circle,),
      child: Image.asset(
        "assets/logo.png",
        height: 100,
        width: 100,
      ),
    ),
          Container(
              child: Row(
            children: [
              Peoples(
                value: "600",
                names: "Following",
              ),
              Peoples(
                value: "12",
                names: "Followers",
              ),
              Peoples(
                value: "20K",
                names: "Likes",
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class Peoples extends StatelessWidget {
  const Peoples({
    super.key,
    required this.value,
    required this.names,
  });
  final String value;
  final String names;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 10,
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              names,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ));
  }
 
}

class LogOut extends StatelessWidget {
  const LogOut({super.key, required this.onpressed});
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text("Logout"),
    );
  }
}
 