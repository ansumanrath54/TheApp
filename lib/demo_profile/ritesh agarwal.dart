import 'package:flutter/material.dart';


class ritesh extends StatefulWidget {
  @override
  _riteshState createState() => _riteshState();
}

class _riteshState extends State<ritesh> {
  int like = 556;
  int dislike = 72;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[

          Stack(
            children: [
              SizedBox.expand(
                child: Image.asset("assets/images/oyo ps.png", fit: BoxFit.cover,),
              ),

            ],

          ),

          DraggableScrollableSheet(
            minChildSize: 0.1,
            initialChildSize: 0.22,
            builder: (context, scrollController){
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //for user profile header
                      Container(
                        padding : EdgeInsets.only(left: 32, right: 32, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipOval(
                                  child: Image.asset('assets/images/ritesh agarwal.jfif', fit: BoxFit.cover,),
                                )
                            ),

                            SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Ritesh Agarwal", style: TextStyle(color: Colors.grey[800], fontFamily: "Roboto",
                                      fontSize: 36, fontWeight: FontWeight.w700
                                  ),),
                                  Text("Oyo", style: TextStyle(color: Colors.grey[500], fontFamily: "Roboto",
                                      fontSize: 16, fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                            ),
                            new IconButton(
                              icon: new Icon(Icons.sms, color: Colors.blue, size: 40,),
                              highlightColor: Colors.pink,
                              onPressed: () {
                                print("Chat was on");
                              },
                            ),
                          ],
                        ),
                      ),

                      //performace bar

                      SizedBox(height: 16,),
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
                                    IconButton(
                                      icon: Icon(Icons.favorite, color: Colors.white, size: 30,),
                                      onPressed: () {
                                        like++;
                                      },
                                    ),
                                      SizedBox(width: 4,),
                                    Text("$like", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto", fontSize: 24
                                    ),)
                                  ],
                                ),

                                Text("promoted by", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto", fontSize: 15
                                ),)
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.favorite_border, color: Colors.white, size: 30,),
                                      onPressed: () {
                                        dislike++;
                                      },
                                    ),

                                    SizedBox(width: 4,),
                                    Text("$dislike", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto", fontSize: 24
                                    ),)
                                  ],
                                ),

                                Text("Demoted by", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto", fontSize: 15
                                ),)
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.star, color: Colors.white, size: 30,),
                                    SizedBox(width: 4,),
                                    Text("5", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto", fontSize: 24
                                    ),)
                                  ],
                                ),

                                Text("Ratings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto", fontSize: 15
                                ),)
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16,),
                      //container for about me

                      Container(
                        padding: EdgeInsets.only(left: 32, right: 32),
                        child: Column(
                          children: <Widget>[
                            Text("About Me", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w700,
                                fontFamily: "Roboto", fontSize: 18
                            ),),

                            SizedBox(height: 8,),
                            Text("OYO is a global platform that empowers entrepreneurs and small businesses with hotels and homes by providing full stack technology"
                                " that increases earnings and eases operations.Bringing affordable and trusted accommodation that guests can book instantly.",
                              style: TextStyle(fontFamily: "Roboto", fontSize: 15),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 16,),
                      //Container for clients

                      Container(
                        padding: EdgeInsets.only(left: 32, right: 32),
                        child: Column(
                          children: <Widget>[
                            Text("Clients", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w700,
                                fontFamily: "Roboto", fontSize: 18
                            ),),

                            SizedBox(height: 8,),
                            //for list of clients
                            Container(
                              width: MediaQuery.of(context).size.width-64,
                              height: 80,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 80,
                                    height: 80,
                                    margin: EdgeInsets.only(right: 8),
                                    child: ClipOval(child: Image.asset("assets/images/friend_pic${index+1}.png", fit: BoxFit.cover,),),
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

                      SizedBox(height: 16,),

                      //Container for reviews

                      Container(
                        padding: EdgeInsets.only(left: 32, right: 32),
                        child: Column(
                          children: <Widget>[
                            Text("Reviews", style: TextStyle(color: Colors.grey[800], fontSize: 18, fontFamily: "Roboto",
                                fontWeight: FontWeight.w700
                            ),),


                            Container(
                              width: MediaQuery.of(context).size.width-64,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Client $index", style: TextStyle(color: Colors.lightBlue, fontSize: 18, fontFamily: "Roboto",
                                              fontWeight: FontWeight.w700
                                          )),

                                          Row(
                                            children: <Widget>[
                                              Icon(Icons.star, color: Colors.orangeAccent,),
                                              Icon(Icons.star, color: Colors.orangeAccent,),
                                              Icon(Icons.star, color: Colors.orangeAccent,),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8,),

                                      Text("He is very fast and good at his work", style: TextStyle(color: Colors.grey[800], fontSize: 14, fontFamily: "Roboto",
                                          fontWeight: FontWeight.w400
                                      )),
                                      SizedBox(height: 16,),
                                    ],
                                  );
                                },
                                itemCount: 8,
                                shrinkWrap: true,
                                controller: ScrollController(keepScrollOffset: false),
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
}
