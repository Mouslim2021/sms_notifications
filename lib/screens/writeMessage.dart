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
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Selectionnez un groupe'),
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
              minLines: 6,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'Message',
                hintText: 'Ecrivez le message à envoyer',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
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
    );
  }
}
