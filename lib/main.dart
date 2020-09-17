import 'package:flutter/material.dart';
import 'package:sms_notifications/screens/home/home.dart';
import 'package:sms_notifications/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:sms_notifications/services/auth.dart';
import 'package:sms_notifications/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'sms notifications',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: Home(),
        home: Wrapper(),
      ),
    );
  }
}

