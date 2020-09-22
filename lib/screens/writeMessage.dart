import 'package:flutter/material.dart';

class WriteMessage extends StatefulWidget {
  @override
  _WriteMessageState createState() => _WriteMessageState();
}

class _WriteMessageState extends State<WriteMessage> {
  final List<String> items = <String>[
    'Electronique',
    'Informatique',
    'Sanitaire'
  ];
  String selectedItem = 'Electronique';
  String categorie;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ecrire un message'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text('Selectionnez un groupe',
                  style: TextStyle(
                    fontSize: 18
                  ),
                  ),
                  SizedBox(
                width: 40,
              ),
                  DropdownButton<String>(
                    value: selectedItem,
                    onChanged: (String string) =>
                        setState(() => selectedItem = string),
                    selectedItemBuilder: (BuildContext context) {
                      return items.map<Widget>((item) {
                        categorie = item;
                        return Text('$categorie');
                      }).toList();
                    },
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        child: Text('$item'),
                        value: item,
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Message',
                  hintText: 'Ecrivez le message à envoyer',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('Envoyer',
                style: TextStyle(
                  color: Colors.white
                ),
                ),
                onPressed: (){},
                )
            ],
          ),
        ),
      ),
    );
  }
}