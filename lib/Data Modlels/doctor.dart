import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Doctor{
  String id;
  String name;
  String phn;
  String degree;
  String networkImageAddress;
  Set<String> categoriesChoosed;
  bool ch1,ch2,ch3,ch4,ch5;

   Doctor({this.name, this.phn, this.degree, this.categoriesChoosed});

  void save() async{
    final DatabaseReference databaseReference = FirebaseDatabase().reference().child("Doctors");
    this.id = phn;
    await databaseReference.push().set({
      'id': this.id,
      'name': this.name,
      'phn': this.phn,
      'degree': this.degree,
      'networkImageAddress': this.networkImageAddress,
      'ch1': this.ch1,
      'ch2': this.ch2,
      'ch3': this.ch3,
      'ch4': this.ch4,
      'ch5': this.ch5
    });
    print('Doctor details saved successfully');
  }

}