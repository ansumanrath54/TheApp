import 'package:cloud_firestore/cloud_firestore.dart';

class PostData {
  String email;
  String r_uid;

  PostData({this.email, this.r_uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Posts');

  Future updateUserData(String name ,String title, String description, String photo, int likes) async {
    return await userCollection.doc(r_uid).set({
      'name': name,
      'email': email,
      'title': title,
      'description': description,
      'photo': photo,
      'likes': likes
    });
  }
}