import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app_starter/screens/profile_screen.dart';
import 'package:social_media_app_starter/services/firebase_api.dart';
import 'package:social_media_app_starter/services/posts.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  User user = FirebaseAuth.instance.currentUser;
  String title, description;
  GlobalKey<FormState> postFormKey = GlobalKey<FormState>();
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
    final destination = 'files/${user.email}/posts/$_image';
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
    if(postFormKey.currentState.validate()) {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Post Issue",style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: postFormKey,
          child: ListView(
            children: [
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  getImage();
                },
                child: _image != null ? Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                    image: DecorationImage(
                      image: FileImage(_image),
                      fit: BoxFit.cover
                    )
                  ),
                  child: null
                ) :
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[300],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo),
                      SizedBox(height: 10,),
                      Text("Upload\nPhoto",textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              _image != null ?
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  uploadImage();
                },
              ) : Container(),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300],
                ),
                child: TextFormField(
                    onChanged: (value) {
                      title = value;
                    },
                    validator: validateInput,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 11.0),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: '       Enter Title',
                      labelStyle: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(height: 30,),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300],
                ),
                child: TextFormField(
                    onChanged: (value) {
                      description = value;
                    },
                    validator: validateInput,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 11.0),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: '       Enter Description',
                      labelStyle: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(height: 50),
              RaisedButton(
                onPressed: () async {
                  if(validate()) {
                    DateTime now = DateTime.now();
                    String rndUid = '${now.hour}${now.minute}${now.second}${now.day}${now.month}${now.year}';
                    print(rndUid + 'HOUR');
                    await PostData(email: user.email, r_uid: rndUid).updateUserData(user.displayName, title, description, _urlDownload, 0);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                  }
                },
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Text('Upload', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
