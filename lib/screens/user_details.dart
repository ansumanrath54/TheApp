import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app_starter/screens/profile_screen.dart';
import 'package:social_media_app_starter/services/firebase_api.dart';
import 'package:social_media_app_starter/services/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  User user = FirebaseAuth.instance.currentUser;
  String name, username, company, about;
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  File _image;
  UploadTask task;
  String _urlDownload = "assets/images/no-photo.jpg";
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
      print(_image);
    });
  }

  Future uploadImage() async {
    if(_image == null && user != null) {
      setState(() {
        _urlDownload = user.photoURL;
      });
      const snackBar = SnackBar(
        content: Text("Profile Picture uploaded successfully"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    final destination = 'files/${user.email}/$_image';
    task = FirebaseApi.uploadFile(destination, _image);

    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      _urlDownload = urlDownload;
    });

    print('Download-Link: $urlDownload');
    const snackBar = SnackBar(
      content: Text("Profile Picture uploaded successfully"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool validate() {
    bool a = false;
    if(profileFormKey.currentState.validate()) {
      setState(() {
        a = true;
      });
      print('Validated');
    }
    else {
      print('Not validated');
    }
    return a;
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
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Text(
              'Enter your Details',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: profileFormKey,
                  child: ListView(
                    children: [
                      SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: _image == null ? (user.photoURL == null ? AssetImage(_urlDownload) : NetworkImage('${user.photoURL}')) :  FileImage(_image),
                              //backgroundImage: NetworkImage(_urlDownload),
                            ),
                            SizedBox(height: 50),
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    getImage();
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.save),
                                  onPressed: () {
                                    uploadImage();
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        onChanged: (value) {
                          name = value;
                        },
                        validator: validateInput,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        onChanged: (value) {
                          username = value;
                        },
                        validator: validateInput,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        onChanged: (value) {
                          company = value;
                        },
                        validator: validateInput,
                        decoration: InputDecoration(
                          labelText: 'Company',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        onChanged: (value) {
                          about = value;
                        },
                        validator: validateInput,
                        decoration: InputDecoration(
                          labelText: 'About',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        height: 50,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.amber,
                          onPressed: () async {
                            if(validate()) {
                              try {
                                final snapShot = await FirebaseFirestore.instance.collection('Users').doc('$username').get();
                                if (snapShot.exists){
                                  const snackBar = SnackBar(
                                    content: Text("Username already exists! Try another"),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                                else{
                                  await user.updateDisplayName(name);
                                  await UserData(email: user.email).updateUserData(name, username, company, about, _urlDownload);
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                                }
                              }
                              catch(e) {
                                print(e);
                              }
                            }
                          },
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
