import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'constants.dart';
import 'package:doc_app/scratch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    run();

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
