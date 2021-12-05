import 'package:flutter/material.dart';

class bhavesh extends StatefulWidget {
  @override
  _bhaveshState createState() => _bhaveshState();
}

class _bhaveshState extends State<bhavesh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[

          SizedBox.expand(
            child: Image.asset("assets/images/ola page.png", fit: BoxFit.cover,),
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
                                  child: Image.asset('assets/images/bhavesh.jfif', fit: BoxFit.cover,),
                                )
                            ),

                            SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Bhavesh Agarwal", style: TextStyle(color: Colors.grey[800], fontFamily: "Roboto",
                                      fontSize: 36, fontWeight: FontWeight.w700
                                  ),),
                                  Text("Ola", style: TextStyle(color: Colors.grey[500], fontFamily: "Roboto",
                                      fontSize: 16, fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                            ),
                            Icon(Icons.sms, color: Colors.blue, size: 40,)
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
                                    Icon(Icons.favorite, color: Colors.white, size: 30,),
                                    SizedBox(width: 4,),
                                    Text("882", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
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
                                    Icon(Icons.favorite_border, color: Colors.white, size: 30,),
                                    SizedBox(width: 4,),
                                    Text("132", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
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
                                    Text("4.7", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
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
                            Text("Ola is India’s largest mobility platform and one of the world’s largest ride-hailing companies, serving 250+ cities across India, Australia, New Zealand, and the UK."
                                "The Ola app offers mobility solutions by connecting customers to drivers and a wide range of vehicles across bikes, auto-rickshaws, metered taxis, and cabs, enabling convenience and transparency for hundreds of millions of consumers and over 1.5 million driver-partners.",
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
