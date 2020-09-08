import 'package:firebase_auth/firebase_auth.dart';
import 'package:sms_notifications/models/user.dart';

class AuthService {

  //create user from FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }



  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Auth anon

  Future signInAnon() async {
    try{
    AuthResult result = await _auth.signInAnonymously(); 
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //Sign in with email and password

  //Register with email and password

  //Sign out



}