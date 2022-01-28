import 'package:flutter/material.dart';

//Pensez à pushReplacement sur les liens du drawer

//Icon(MdiIcons.newspaperVariantMultipleOutline) //Actualités
// Icon(Icons.event_note_outlined) //Evènements
//Icon(MdiIcons.postOutline) //Communiqués

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final List<Map<dynamic, dynamic>> _drawerItems = [
    {
      'title': 'Accueil',
      'icon': Icon(
        Icons.home_outlined,
      ),
      'routeName': '/'
    },
    {
      'title': 'Info',
      'icon': Icon(Icons.info),
      'routeName': '/about',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/avatar.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    "username",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "phone",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  ListTile(
                    leading: Icon(Icons.home_outlined),
                    title: Text(
                      'Accueil',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(
                        '/',
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(
                      'À propos',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).popAndPushNamed('/about');
                    },
                  ),

                  Divider(),
                  ListTile(
                    leading: Icon(Icons.import_export),
                    title: Text(
                      'Export de données',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).popAndPushNamed('/export');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Center(
                  //   child: Text(
                  //     'v 1.0',
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              'MyContacts Mobile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              'version 0.0.1',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
