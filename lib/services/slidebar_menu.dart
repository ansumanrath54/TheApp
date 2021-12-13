import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_app_starter/screens/onboarding_screen.dart';
import 'package:social_media_app_starter/screens/post_page.dart';
import 'package:social_media_app_starter/screens/upload_screen.dart';
import 'package:social_media_app_starter/screens/user_details.dart';
import '../details.dart';

class SlideBarMenu extends StatelessWidget {
  const SlideBarMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    User user = FirebaseAuth.instance.currentUser;
    final googleSignIn = GoogleSignIn();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('${user.displayName}'),
            accountEmail: Text('${user.email}'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network('${user.photoURL}'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Post an Idea'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text('See others Posts'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UploadScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.comment),
            title: Text('Comment'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Profile'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetails()));
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('Logout'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text("Logout"),
                    content: Text("Are you sure you want to logout?"),
                    actions: [
                      FlatButton(
                        child: Text("NO"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text("YES"),
                        onPressed: () async {
                          try {
                            await googleSignIn.disconnect();
                          } catch(e) {
                            print(e);
                          }
                          await FirebaseAuth.instance.signOut();
                          const snackBar = SnackBar(
                            content: Text("You're logged out!"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
                        },
                      )
                    ],
                  ));
            },
          )
        ],
      ),
    );
  }
}
