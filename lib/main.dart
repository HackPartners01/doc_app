import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'constants.dart';
import 'package:doc_app/scratch.dart';
import 'services/location.dart';

void main() {
  runApp(MyApp());
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    run();
    location.keepGettingCurrentLocation();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        primaryColor: kColorDarkGrey,
        accentColor: kColorOrange,
      ),
      home: HomePage(),
    );
  }
}
