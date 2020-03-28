import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class User {
  const User({@required this.uid});
  final String uid;
}

class FirebaseAuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user){
  return user == null ? null:User(uid: user.uid);
  }

  Stream <User> get onAuthChanged{
      return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  //sign in anonymously
  Future <User> signInAnonymously() async {
    try {
      final authResult = await _auth.signInAnonymously();
      return _userFromFirebase(authResult.user);
    } catch (e) {
      print(e.toString());
    }
  } 

  Future<void> signOut() async {
    return await _auth.signOut();
  }


}
