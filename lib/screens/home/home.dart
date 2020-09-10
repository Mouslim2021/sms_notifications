import 'package:flutter/material.dart';
import 'package:sms_notifications/services/auth.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'accueil'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async => await _auth.signOut(),
            icon: Icon(Icons.exit_to_app),
            label: Text('Quitter'),)
        ],
      ),
      body: Center(
        child: Text('Accueil'),
      ),
    );
  }
}