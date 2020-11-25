import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Doctor{
  String id;
  String name;
  String phn;
  String degree;
  String networkImageAddress;
  Set<String> categoriesChoosed;

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
      'categoriesChoosed': this.categoriesChoosed,
    });
    print('Doctor details saved successfully');
  }

}