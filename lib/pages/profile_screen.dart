import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    FirebaseAuth user = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        centerTitle: false,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Color(0xFF110C26),
            fontSize: 24,
            fontFamily: 'Airbnb Cereal App',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: db.collection("Users").doc(user.currentUser!.uid).snapshots(),
          builder: (context, snapshot) {
            return ProfileCard(snap: snapshot.data,);
          }
        ),
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  final snap;
  const ProfileCard({super.key,required this.snap});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 27,
                left: 138,
                right: 137,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/profile.jpg"),
                  radius: 50,
                ),
              ),
              Positioned(
                left: 108,
                top: 140,
                child: Text(
                  widget.snap["email"],
                  style: TextStyle(
                    color: Color(0xFF110C26),
                    fontSize: 24,
                    fontFamily: 'Airbnb Cereal App',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                top: 175,
                left: 100,
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "350",
                              style: TextStyle(
                                color: Color(0xFF110C26),
                                fontSize: 16,
                                fontFamily: 'Airbnb Cereal App',
                                fontWeight: FontWeight.w500,
                                height: 0.13,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                color: Color(0xFF747688),
                                fontSize: 14,
                                fontFamily: 'Airbnb Cereal App',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "346",
                              style: TextStyle(
                                color: Color(0xFF110C26),
                                fontSize: 16,
                                fontFamily: 'Airbnb Cereal App',
                                fontWeight: FontWeight.w500,
                                height: 0.13,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                color: Color(0xFF747688),
                                fontSize: 14,
                                fontFamily: 'Airbnb Cereal App',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 110,
                top: 210,
                child: Container(
                  width: 154,
                  height: 50,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFF5668FF),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: 22,
                          width: 22,
                          child: Icon(Icons.edit_note)),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Color(0xFF5668FF),
                            fontSize: 16,
                            fontFamily: 'Airbnb Cereal App',
                            fontWeight: FontWeight.w400,
                            height: 0.10,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          'About Me',
          style: TextStyle(
            color: Color(0xFF110C26),
            fontSize: 18,
            fontFamily: 'Airbnb Cereal App',
            fontWeight: FontWeight.w500,
            height: 0.10,
          ),
        ),
        SizedBox(height: 20,),
       
        // SizedBox(
        //   child: Text(
        //     "Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. ",
        //     style: TextStyle(
        //         color: Color(0xFF3C3E56),
        //         fontSize: 16,
        //         fontFamily: 'Airbnb Cereal App',
        //         fontWeight: FontWeight.w400,
        //         height: 0.10,
        //         overflow: TextOverflow.ellipsis),
            
        //   ),
        // ),
       SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Interest',
              style: TextStyle(
                color: Color(0xFF172B4D),
                fontSize: 18,
                fontFamily: 'Airbnb Cereal App',
                fontWeight: FontWeight.w500,
                height: 0.10,
              ),
            ),
            Container(
              width: 98,
              height: 28,
              decoration: ShapeDecoration(
                color: Color(0xFF5668FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x144AD2E4),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.edit,
                  ),
                  Text(
                    "Change",
                    style: TextStyle(
                      color: Color(0xFF5668FF),
                      fontSize: 10,
                      fontFamily: 'Airbnb Cereal App',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          child: Row(
            children: [
              Container(
                width: 81,
                height: 31,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                decoration: ShapeDecoration(
                  color: Color(0xFFEE544A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text("Cocert"),
              )
            ],
          ),
        )
      ],
    );
  }
}
