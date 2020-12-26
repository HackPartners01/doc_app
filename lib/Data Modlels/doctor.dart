import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Doctor{
  String id;
  String name;
  String phn;
  String degree;
  String networkImageAddress;
  bool ch1,ch2,ch3,ch4,ch5;
  bool available = true;

   Doctor({this.name, this.phn, this.degree, this.id, this.networkImageAddress, this.ch4, this.ch3, this.ch2, this.ch1, this.ch5, this.available});

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
      'ch5': this.ch5,
      'available': this.available
    });
    print('Doctor details saved successfully');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phn': phn,
      'degree': this.degree,
      'networkImageAddress': this.networkImageAddress,
      'ch1': this.ch1==true?1:0,
      'ch2': this.ch2==true?1:0,
      'ch3': this.ch3==true?1:0,
      'ch4': this.ch4==true?1:0,
      'ch5': this.ch5==true?1:0,
      'available': this.available?1:0
    };
  }

}