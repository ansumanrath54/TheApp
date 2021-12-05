import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String email;

  UserData({this.email});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');

  Future updateUserData(String name, String username, String company, String about, String photo) async {
    return await userCollection.doc(email).set({
      'name': name,
      'username': username,
      'email': email,
      'company': company,
      'about': about,
      'photo': photo
    });
  }
}