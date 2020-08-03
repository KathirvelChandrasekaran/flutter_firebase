import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/modal/user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFire(FirebaseUser user) {
    return user != null ? User(userId: user.uid) : null;
  }

  Future signInWithEmail(String email, String password) async {
    try {
      AuthResult res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = res.user;
      return _userFromFire(user);
    } catch (err) {
      print(err);
    }
  }

  Future signUpWithEmail(String email, String password) async {
    try {
      AuthResult res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = res.user;
      return _userFromFire(user);
    } catch (err) {
      print(err);
    }
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (err) {
      print(err);
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err);
    }
  }
}
