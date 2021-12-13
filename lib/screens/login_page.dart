import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_app_starter/constants/constant.dart';
import 'package:social_media_app_starter/screens/profile_screen.dart';
import 'package:social_media_app_starter/screens/user_details.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final auth=FirebaseAuth.instance;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String email;
  String password;

  void validate() {
    if(loginFormKey.currentState.validate()) {
      print('Validated');
    }
    else {
      print('Not validated');
    }
  }

  String validateInput(value) {
    if(value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: new BoxDecoration(
            image: new DecorationImage(
          image: new AssetImage("assets/images/onboarding.png"),
          fit: BoxFit.fill,
        )),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Welcome to UpBuz",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Admin",
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              )),
              child: Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              key: loginFormKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(color: Colors.grey)),
                    validator: validateInput,
                    onChanged: (value){
                      email=value;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: TextStyle(color: Colors.grey)),
                    obscureText: true,
                    validator: validateInput,
                    onChanged: (value){
                      password=value;
                    },
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      validate();
                      loginUser();
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        color: Colors.cyan[500],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  MaterialButton(
                    onPressed: () {
                      loginGoogle();
                    },
                    color: kWhiteColor,
                    minWidth: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/icons8-google-24.png",
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Log in with Google',
                          style: TextStyle(
                            fontSize: 16,
                            color: kBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: TextStyle(
                        fontSize: 15.0
                      ),),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: Text('Sign Up', style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontSize: 15.0,
                        ),),
                      )
                    ],
                  ),
                ],
              ),
            ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void loginUser() async{
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password)
        .then((FirebaseUser) async{
      const snackBar = SnackBar(
        content: Text("You're successfully logged in!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      final snapShot = await FirebaseFirestore.instance.collection('Users').doc('$email').get();
      if (snapShot.exists){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserDetails()));
      }
    })
        .catchError((e){
      print(e);
      showDialog(context: context, builder: (ctx) => AlertDialog(
        title: const Text("Alert!"),
        content: const Text("Invalid Email or Password"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
      );
    });
  }

  Future<void> loginGoogle() async {
    await FirebaseAuth.instance.signOut();
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    const snackBar = SnackBar(
      content: Text("You're signed in successfully!"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
      final snapShot = await FirebaseFirestore.instance.collection('Users').doc('${googleUser.email}').get();
      if (snapShot.exists){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserDetails()));
      }
    });
  }
}
