import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AppColor {
  static var black = Color(0xFF2F2F3E);
  static var bodyColor = Color(0xFF6F8398);
}

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              header(),
              SizedBox(
                height: 40,
              ),
              hero(),
              SizedBox(
                height: 40,
              ),
              Expanded(child: section()),
              SizedBox(
                height: 10,
              ),
              IconButton(
                icon: new Icon(Icons.comment_bank, color: Colors.blue, size: 40,),
                highlightColor: Colors.black87,
                onPressed: () {
                  onButtonPressed();
                },
              ),
            ],
          ),
        ),

    );
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 160,),
          Column(
            children: [
              Text("Oyo",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
            ],
          ),
        ],
      ),
    );
  }

  Widget hero() {
    return Container(
      child: Stack(
        children: [
          Image.asset('assets/images/oyo.png'),

        ],
      ),
    );
  }

  Widget section() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            "The upcoming IPO of OYO is on the back foot. This is because the Federation of Hotel & Restaurant Associations of India (FHRAI)"
                " the regulatory body of the hotels, has written to SEBI, charging the company over alleged fraudulent and unfair business practices,"
                " as reported on October 26, 2021",
            textAlign: TextAlign.justify,
            style:
            TextStyle(color: AppColor.bodyColor, fontSize: 14, height: 1.5),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
  void onButtonPressed() {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        // ignore: missing_return
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height*0.75,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Solutions',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.16,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CircleAvatar(
                                  backgroundColor: Colors.black87,
                                  radius: 15.0,
                                  backgroundImage: AssetImage(
                                    "assets/images/friend_pic1.png",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Robert livingstone",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(icon: Icon(FontAwesomeIcons.arrowUp,color: Colors.blue,),
                                      onPressed: () {}
                                  ),
                                  Text(
                                      '0',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  IconButton(icon: Icon(FontAwesomeIcons.reply,color: Colors.yellow,),
                                      onPressed: () {}
                                  ),
                                  IconButton(icon: Icon(FontAwesomeIcons.trashAlt,color: Colors.red,),
                                      onPressed: () {}
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.blue,size: 12,),
                                  onPressed: () {}
                              ),
                              Text(
                                'Listing it to Ipo wasnot good',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.black.withOpacity(0.2),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)
              )
            ),
          );
        }
    );
  }
}



