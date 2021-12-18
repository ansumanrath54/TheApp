import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding.png'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 40, 5, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 70),
                  Text('Contact Us', style: GoogleFonts.breeSerif(fontSize: 30, color: Colors.white),),
                ],
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Name:- Sarthak Pujari\nEmail:- sarthak.pujari2009@gmail.com \nRole:- Frontend Developer', style: GoogleFonts.breeSerif(fontSize: 21, color: Colors.white),),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Name:- Ansuman Rath\nEmail:- ansumanrath54@gmail.com \nRole:- Frontend and Backend Developer', style: GoogleFonts.breeSerif(fontSize: 21, color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
