import 'package:doc_app/Data%20Modlels/doctor.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

const Color kColorOrange = Color(0xffffa62b);
const Color kColorWhite = Color(0xffffffff);
const Color kColorLightGrey = Color(0xffeeeeee);
const Color kColorDarkGrey = Color(0xff686d76);
const Color kColorDarkestGrey = Color(0xff373a40);

Doctor me;
int localId;
List<Doctor> listOfDoctors = new List();

updateListOfDoctors() async{
  listOfDoctors.clear();
  DatabaseReference db = FirebaseDatabase.instance.reference().child("Doctors");
  db.once().then((DataSnapshot snapshot){
    Map<dynamic, dynamic> values = snapshot.value;
    Doctor d;
    values.forEach((key,values) {
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
      if(!listOfDoctors.contains(d)) listOfDoctors.add(d);
    }
    );
  });


}
