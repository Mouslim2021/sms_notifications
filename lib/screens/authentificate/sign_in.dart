import 'package:flutter/material.dart';
import 'package:sms_notifications/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Connexion anonym'),
            onPressed: () async{
              dynamic result = _auth.signInAnon();
              if(result == null){
                print('Erreur de connexion');
              } else{
                print('Connexion reussi');
                print(result);
              }
            },
            ),
        ),
      ),
    );
  }
}