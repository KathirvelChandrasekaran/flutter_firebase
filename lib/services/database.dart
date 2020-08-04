import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  getUser(String userName) async {
    return await Firestore.instance
        .collection('users')
        .where("name", isEqualTo: userName)
        .getDocuments();
  }

  postUserInfo(userMap) {
    Firestore.instance.collection('users').add(userMap).catchError((e) => e);
  }
}
