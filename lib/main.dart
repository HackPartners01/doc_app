import 'package:doc_app/Constants.dart';
import 'package:doc_app/screens/me_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Data Modlels/doctor.dart';
import 'screens/home_page.dart';
import 'package:doc_app/scratch.dart';
import 'services/location.dart';



void main() async {
  runApp(MyApp());
  Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  _readLocal();


}

_readLocal() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'doc_id';
  final value = prefs.getInt(key) ?? 0;
  if(value!=null){

    DatabaseReference db = FirebaseDatabase.instance.reference().child("Doctors");
    db.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      Doctor d;
      values.forEach((key,values) {
        if(values['id']=='$value') {
          d = Doctor(
            id: values['id'],
            name: values['name'],
            phn: values['phn'],
            degree: values['degree'],
            networkImageAddress: values['networkImageAddress'],
            ch1: values['ch1'],
            ch2: values['ch2'],
            ch3: values['ch3'],
            ch4: values['ch4'],
            ch5: values['ch5'],
          );
        }
        me = d;
      }
      );
    });


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
    _readLocal();
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
