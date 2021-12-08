import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_app_starter/chat_app/modules/chat_page.dart';
import 'package:social_media_app_starter/services/slidebar_menu.dart';

import 'onboarding_screen.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int toggle = 0;

class _MyHomePageState extends State<MyHomePage> {

  String name = "Guest";
  String company = "?";
  String about = "No description";
  String photo = "assets/images/no-photo.jpg";
  final googleSignIn = GoogleSignIn();
  User user = FirebaseAuth.instance.currentUser;
  bool folded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldkey,
      drawer: SlideBarMenu(),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.asset(
              "assets/images/upbuz profile.png",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: IconButton(
              onPressed: () {
                scaffoldkey.currentState.openDrawer();
              },
              icon: Icon(Icons.menu),
              color: Colors.white,
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.1,
            initialChildSize: 0.22,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //for user profile header
                      Container(
                        padding: EdgeInsets.only(left: 32, right: 32, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipOval(
                                  child: Image.network(
                                    '$photo',
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    name,
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontFamily: "Roboto",
                                        fontSize: 36,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    company,
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontFamily: "Roboto",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            new IconButton(
                              icon: new Icon(Icons.sms),
                              highlightColor: Colors.pink,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
                                print("Chat was on");
                              },
                            ),
                          ],
                        ),
                      ),

                      //performace bar

                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.all(32),
                        color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "234",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Roboto",
                                          fontSize: 24),
                                    )
                                  ],
                                ),
                                Text(
                                  "promoted by",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                      fontSize: 15),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "400",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Roboto",
                                          fontSize: 24),
                                    )
                                  ],
                                ),
                                Text(
                                  "Demoted by",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                      fontSize: 15),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "5",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Roboto",
                                          fontSize: 24),
                                    )
                                  ],
                                ),
                                Text(
                                  "Ratings",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),
                      //container for about me

                      Container(
                        padding: EdgeInsets.only(left: 32, right: 32),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "About Me",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Roboto",
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              about,
                              style:
                                  TextStyle(fontFamily: "Roboto", fontSize: 15),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),
                      //Container for clients

                      Container(
                        padding: EdgeInsets.only(left: 32, right: 32),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Clients",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Roboto",
                                  fontSize: 18),
                            ),

                            SizedBox(
                              height: 8,
                            ),
                            //for list of clients
                            Container(
                              width: MediaQuery.of(context).size.width - 64,
                              height: 80,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 80,
                                    height: 80,
                                    margin: EdgeInsets.only(right: 8),
                                    child: ClipOval(
                                      child: Image.asset(
                                        "assets/images/friend_pic${index + 1}.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      //Container for reviews

                      Container(
                        padding: EdgeInsets.only(left: 32, right: 32),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Reviews",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 18,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 64,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Client $index",
                                              style: TextStyle(
                                                  color: Colors.lightBlue,
                                                  fontSize: 18,
                                                  fontFamily: "Roboto",
                                                  fontWeight: FontWeight.w700)),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.star,
                                                color: Colors.orangeAccent,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orangeAccent,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orangeAccent,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                          "He is very fast and good at his work",
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 14,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  );
                                },
                                itemCount: 8,
                                shrinkWrap: true,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Future getData() async {
    var variable = await FirebaseFirestore.instance.collection('Users').doc('${user.email}').get();
    setState(() {
      name = variable['name'];
      company = variable['company'];
      about = variable['about'];
      photo = variable['photo'];
    });
  }
}
