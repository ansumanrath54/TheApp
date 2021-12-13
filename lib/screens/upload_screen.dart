import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_app_starter/services/posts.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {

  User user = FirebaseAuth.instance.currentUser;
  String name, title, description, photo, email;
  int likes;
  int length = 0;
  Color _color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 80),
                Text('UpBuz', style: GoogleFonts.breeSerif(fontSize: 40, fontWeight: FontWeight.w700),),
                //SizedBox(height: 30)
              ],
            ),
            Container(
              height: 610,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return ListView(children: getPosts(snapshot));
                }),
            )
          ],
        ),
      ),
    );
  }

  getPosts(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.docs
        .map((doc) =>
        Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffD4D4D4)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doc['name'], style: GoogleFonts.poppins(fontSize: 18),),
              SizedBox(height: 10),
              Text(doc['email'], style: GoogleFonts.poppins(fontSize: 17),),
              SizedBox(height: 10),
              Text('Title:- ${doc['title']}',
                style: GoogleFonts.poppins(fontSize: 17),),
              SizedBox(height: 10),
              Text('Description:-\n${doc['description']}',
                style: GoogleFonts.poppins(fontSize: 17),),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (_color == Colors.grey) {
                        setState(() async {
                          _color = Colors.pink;
                          await PostData(email: user.email, r_uid: doc.id)
                              .updateUserData(
                              doc['name'], doc['title'], doc['description'],
                              doc['photo'], doc['likes'] + 1);
                        });
                      }
                      else {
                        setState(() async {
                          _color = Colors.grey;
                          await PostData(email: user.email, r_uid: doc.id)
                              .updateUserData(
                              doc['name'], doc['title'], doc['description'],
                              doc['photo'], doc['likes'] - 1);
                        });
                      }
                    },
                    icon: Icon(Icons.favorite, color: _color,),
                  ),
                  SizedBox(width: 10),
                  Text('${doc['likes']} Likes'),
                  SizedBox(width: 30),
                  IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.chat),
                  ),
                  SizedBox(width: 10),
                  Text('Comment'),
                ],
              )
            ],
          ),
        )).toList();
  }
}

