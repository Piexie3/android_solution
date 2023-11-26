import 'package:flutter/material.dart';

class BlockCard extends StatelessWidget {
  const BlockCard({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 2, 181, 50),
            Color.fromARGB(255, 69, 253, 118),
            Color.fromARGB(255, 203, 252, 216),
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Stack(
        children: [
          //image
          Positioned(
            left: 10,
            top: 10,
            bottom: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Image.network(
                "https://plus.unsplash.com/premium_photo-1695554950328-f86c97e93e30?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                
              ),
            ),
          ),
          //Row texts

          Positioned(
            left: 120,
            right: 10,
            bottom: 10,
            child: Container(
              height: 160,
              child: Column(
                children: [
                  Text(
                    "Swiss cheese Plant",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis
                      ),
                      maxLines: 7,
                    ),
                  )
                ],
              ),
            ),
          ),
          //button
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 116, 118, 0),
                      Color.fromARGB(255, 252, 255, 72),
                      Color.fromARGB(255, 254, 255, 212),
                    ],
                  ),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
