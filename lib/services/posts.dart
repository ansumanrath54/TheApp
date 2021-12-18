import 'package:cloud_firestore/cloud_firestore.dart';

class PostData {
  String email;
  String r_uid;

  PostData({this.email, this.r_uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Posts');

  Future updateUserData(String name, String profile_pic, String title, String description, String photo, int likes) async {
    return await userCollection.doc(r_uid).set({
      'name': name,
      'profile_pic': profile_pic,
      'email': email,
      'title': title,
      'description': description,
      'photo': photo,
      'likes': likes
    });
  }
}