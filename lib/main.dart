import 'package:doc_app/Constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_page.dart';
import 'package:doc_app/scratch.dart';
import 'services/location.dart';



void main() async {
  runApp(MyApp());
  Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  await updateListOfDoctors();
  await _readLocal();


}

_readLocal() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'doc_id';
  final value = prefs.getInt(key) ?? 0;
  localId = value;
  for(int i=0;i<listOfDoctors.length;i++){
    if(listOfDoctors[i].id=='$localId'){
      me = listOfDoctors[i];
      break;
    }
  }
}



class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
// This widget is the root of your application.

}

class MyAppState extends State<MyApp> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
  }


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
