import 'package:flutter/material.dart';
import 'package:sms_notifications/screens/writeMessage.dart';
import 'package:sms_notifications/services/auth.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    var animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );
    _animationController = animationController;

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  addGroup() {
    AlertDialog _alertDialog = AlertDialog(
        backgroundColor: Colors.white,
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
      backgroundColor: Colors.white,
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
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Prenom',
                hintText: 'Entrez le prenom',
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
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Personnalité',
                hintText: 'Entrez la personnalité',
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
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Téléphone',
                hintText: 'Entrez le téléphone',
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
  List<Classes> mesClasses = [
    Classes(nom: '7ème Année', icone: Icons.games),
    Classes(nom: '8ème Année', icone: Icons.golf_course),
    Classes(nom: '9ème Année', icone: Icons.hdr_strong),
    Classes(nom: '10ème Année', icone: Icons.headset_off),
    Classes(nom: '11ème Année', icone: Icons.healing),
    Classes(nom: '12ème Année', icone: Icons.home),
    Classes(nom: 'Terminale SS', icone: Icons.important_devices),
    Classes(nom: 'Terminale SM', icone: Icons.inbox),
    Classes(nom: 'Terminale SE', icone: Icons.info_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page d\'accueil'),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async => await _auth.signOut(),
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              label: Text(
                'Quitter',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: mesClasses.length,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  title: Text(
                    mesClasses[i].nom,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(
                    mesClasses[i].icone,
                    size: 30,
                    color: Colors.blue,
                  ),
                  onTap: () => addPerson(),
                ),
              );
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        //Init Floating Action Bubble
        floatingActionButton: FloatingActionBubble(
          backGroundColor: Colors.blue,
          // Menu items
          items: <Bubble>[
            // Floating action menu item
            Bubble(
              title: "Message",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.message,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _animationController.reverse();
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return WriteMessage();
                }));
              },
            ),
            //Floating action menu item
            Bubble(
              title: "Groupe",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.people,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
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
          animatedIconData: AnimatedIcons.menu_close,
        ));
  }
}

class Classes {
  String nom;
  IconData icone;
  Classes({this.nom, this.icone});
}
