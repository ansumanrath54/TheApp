import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_app_starter/screens/login_page.dart';
import 'package:social_media_app_starter/screens/profile_screen.dart';
import 'package:social_media_app_starter/screens/user_details.dart';
import '../constants/constant.dart';
import '../demo_profile/nikhil kamath.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;
  String email;
  String password;
  String confirmPassword;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void validate() {
    if (signupFormKey.currentState.validate()) {
      print('Validated');
    } else {
      print('Not validated');
    }
  }

  String validateInput(value) {
    if (value.isEmpty) {
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
        height: MediaQuery.of(context).size.height,
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
                      "Sign Up",
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
              key: signupFormKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(color: Colors.grey)),
                    // ignore: missing_return
                    validator: validateInput,
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: validateInput,
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Confirm your Password",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: validateInput,
                    onChanged: (value) {
                      confirmPassword = value;
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        validate();
                        signUpUser();
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      signupGoogle();
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
                          'Sign up with Google',
                          style: TextStyle(
                            fontSize: 16,
                            color: kBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => nikhil(),
                        ),
                      );
                    },
                    color: kFacebookColor,
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
                          "assets/images/facebook_logo.png",
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Sign up with Facebook',
                          style: TextStyle(
                            fontSize: 16,
                            color: kWhiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: TextStyle(
                          fontSize: 15.0
                      ),),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text('Login', style: TextStyle(
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

  Future<void> signUpUser() async {
    if(password.toString() == confirmPassword.toString())
    {
      try{
        await auth.createUserWithEmailAndPassword(
          email: email, password: password,).then((value) async {
          //await auth.currentUser!.updateDisplayName(name);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserDetails()));
        });
      }
      catch(e){
        if(password.length < 6) {
          showDialog(context: context, builder: (ctx) => AlertDialog(
            title: const Text("Information"),
            content: const Text("Please enter a valid password"),
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
        }
        else {
          showDialog(context: context, builder: (ctx) => AlertDialog(
            title: const Text("Information"),
            content: const Text("Please input correct email"),
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
        }
      }
    }
    else {
      showDialog(context: context, builder: (ctx) => AlertDialog(
        title: const Text("Alert!"),
        content: const Text("Password did not match"),
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
    }
  }

  Future<void> signupGoogle() async {
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
