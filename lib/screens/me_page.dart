import 'package:doc_app/Constants.dart';
import 'package:doc_app/Data%20Modlels/doctor.dart';
import 'package:doc_app/screens/doctor_form.dart';
import 'package:doc_app/screens/doctor_page.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

Doctor doc;

class MePage extends StatelessWidget {
  MePage({Doctor d}) {
    if (d != null)
      doc = d;
  }

  @override
  Widget build(BuildContext context){
    return doc != null ? DoctorPage(d: doc) : me==null?DoctorForm(): DoctorPage(d: me);
  }
}
