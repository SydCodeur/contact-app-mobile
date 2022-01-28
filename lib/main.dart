import 'package:my_contacts/screens/about_screen.dart';
import 'package:my_contacts/screens/export_data.dart';

import './providers/users.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import './palette.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        title: 'My Contacts App',
        theme: ThemeData(
          primarySwatch: Palette.kToDark,
          fontFamily: 'Lato',
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          AboutScreen.routeName: (ctx) => AboutScreen(),
          ExportData.routeName: (ctx) => ExportData()
        },
      ),
    );
  }
}
