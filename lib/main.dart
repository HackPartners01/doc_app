import 'package:doc_app/Constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Data Modlels/doctor.dart';
import 'screens/home_page.dart';
import 'package:doc_app/scratch.dart';
import 'services/location.dart';



void main() async {
  runApp(MyApp());
  Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'doctor_db.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE docTable(id TEXT , name TEXT, phn TEXT, degree TEXT, networkImageAddress TEXT, ch1 INTEGER, ch2 INTEGER, ch3 INTEGER, ch4 INTEGER, ch5 INTEGER)",
      );
    },
    version: 1,
  );

  Future<Doctor> getSavedDoctor() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('docTable');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Doctor(
        id: maps[i]['id'],
        name: maps[i]['name'],
        phn: maps[i]['phn'],
        degree: maps[i]['degree'],
        networkImageAddress: maps[i]['networkImageAddress'],
        ch1: maps[i]['ch1']==0?false: true,
        ch2: maps[i]['ch2']==0?false: true,
        ch3: maps[i]['ch3']==0?false: true,
        ch4: maps[i]['ch4']==0?false: true,
        ch5: maps[i]['ch5']==0?false: true,
      );
    })[0];
  }

  me = await getSavedDoctor();

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
