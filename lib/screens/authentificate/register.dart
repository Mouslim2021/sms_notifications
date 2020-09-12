import 'package:flutter/material.dart';
import 'package:sms_notifications/screens/loading.dart';
import 'package:sms_notifications/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;


  String email ='';
  String password ='';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loadong() : Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              widget.toggleView();
            },
            icon: Icon(Icons.person), 
            label: Text('Connexion'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                 decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Entrez votre email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    )
                  ),
                ),
                validator: (val) => val.isEmpty ? 'L\'email est obligatoire' : null,
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },

              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                 decoration: InputDecoration(
                  hintText: 'Mot de passe',
                  labelText: 'Entrez votre mot de passe',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    )
                  ),
                ),
                validator: (val) => val.isEmpty ? 'Le mot de passe est obligatoire' : null,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
                obscureText: true,

              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('Inscription'),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    setState(() {
                      loading = true;
                    });
                    dynamic result = _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = 'Veuillez entrer un email valide';
                        loading = false;
                      });
                    }
                  }
                }),
                SizedBox(
                height: 10,
              ),
              Text(error,
              style: TextStyle(
                color: Colors.red
               ),
              )
            ],
          )
        ),
      ),
    );
  }
}