import 'package:flutter/material.dart';
import 'package:sms_notifications/screens/writeMessage.dart';
import 'package:sms_notifications/services/auth.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

   Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState(){
        
    var animationController = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 260),
        );
        _animationController = animationController;

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    
    super.initState();

  }

  addGroup() {
    AlertDialog _alertDialog = AlertDialog(
        backgroundColor: Colors.transparent,
        title: Text(
          'Ajouter un groupe',
        ),
        content: Container(
          color: Colors.white,
          height: 110,
          width: double.infinity * 0.85,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom du groupe',
                  hintText: 'Entrez le nom du groupe',
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
            ],
          ),
        ),
        actions: <Widget>[
          Row(children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(
                context,
              ),
              child: Text(
                'Valider',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            FlatButton(
              onPressed: () => Navigator.pop(
                context,
              ),
              child: Text(
                'Annuler',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ])
        ]);
    showDialog(
      barrierDismissible: false,
      context: context,
      child: _alertDialog,
    );
  }

  addPerson() {
    AlertDialog _alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      title: Text(
        'Ajouter une personne',
      ),
      content: Container(
        color: Colors.white,
        height: 310,
        width: double.infinity * 0.85,
        child: Column(
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(
              labelText: 'Nom',
              hintText: 'Entrez le nom',
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
            )),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Prenom',
                hintText: 'Entrez le prenom',
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
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Personnalité',
                hintText: 'Entrez la personnalité',
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
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Téléphone',
                hintText: 'Entrez le téléphone',
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
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Valider',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Annuler',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        )
      ],
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      child: _alertDialog,
    );
  }

  final AuthService _auth = AuthService();
  List<Activites> mesActivites = [
    Activites(nom: 'football', icone: Icons.games),
    Activites(nom: 'Golf', icone: Icons.golf_course),
    Activites(nom: 'basketball', icone: Icons.hdr_strong),
    Activites(nom: 'Baseball', icone: Icons.headset_off),
    Activites(nom: 'Tenis', icone: Icons.healing),
    Activites(nom: 'Natation', icone: Icons.home),
    Activites(nom: 'Volley-ball', icone: Icons.important_devices),
    Activites(nom: 'Billard', icone: Icons.inbox),
    Activites(nom: 'Tenis-table', icone: Icons.info_outline),
    Activites(nom: 'Athletisme', icone: Icons.insert_emoticon),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'accueil'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async => await _auth.signOut(),
            icon: Icon(Icons.exit_to_app),
            label: Text('Quitter'),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: mesActivites.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(
                mesActivites[i].nom,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailing: Icon(
                mesActivites[i].icone,
                size: 40,
                color: Colors.blue,
              ),
              onTap: () => addPerson(),
            );
          }),
    /*   floatingActionButton: FloatingActionButton(
        onPressed: () => addGroup(),
        child: Icon(
          Icons.arrow_drop_up,
          size: 40,
        ),
      ), */
       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      
      //Init Floating Action Bubble 
      floatingActionButton: FloatingActionBubble(
        backGroundColor: Colors.blue,
        // Menu items
        items: <Bubble>[
          
          // Floating action menu item
          Bubble(
            title:"Message",
            iconColor :Colors.white,
            bubbleColor : Colors.blue,
            icon:Icons.people,
            titleStyle:TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
              _animationController.reverse();
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return WriteMessage();
              }));
            },
          ),
          //Floating action menu item
          Bubble(
            title:"Groupe",
            iconColor :Colors.white,
            bubbleColor : Colors.blue,
            icon:Icons.home,
            titleStyle:TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
              _animationController.reverse();
              addGroup();
            },
          ),
        ],

        // animation controller
        animation: _animation,

        // On pressed change animation state
        onPress: () => _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward(),
        
        // Floating Action button Icon color
        iconColor: Colors.blue,

        // Flaoting Action button Icon 
        animatedIconData: AnimatedIcons.add_event,
      )
    );
  }
}

class Activites {
  String nom;
  IconData icone;
  Activites({this.nom, this.icone});
}
