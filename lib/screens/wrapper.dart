import 'package:flutter/material.dart';
import 'package:sms_notifications/screens/authentificate/authenticate.dart';
import 'package:sms_notifications/screens/authentificate/sign_in.dart';
import 'package:sms_notifications/screens/home/home.dart';
import 'package:sms_notifications/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
  
  if (user == null){
     return Authenticate();
  }else{
    return Home();
  }
   
  }
}