import 'package:flutter/material.dart';

import 'Components/side_nav_drawer.dart';
import 'Constants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        primaryColor: darkGrey,
        accentColor: orange,

      ),
      home: Scaffold(
        drawer: SideNavDrawer(),
        appBar: AppBar(
          title: Text('DocApp'),
        ),

      ),
    );
  }
}
