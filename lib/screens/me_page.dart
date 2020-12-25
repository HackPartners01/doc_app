import 'package:doc_app/Constants.dart';
import 'package:doc_app/Data%20Modlels/doctor.dart';
import 'package:doc_app/screens/doctor_form.dart';
import 'package:doc_app/screens/doctor_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Doctor doc;

class MePage extends StatefulWidget {
  MePage({Doctor d}) {
    if (d != null)
      doc = d;
  }

  @override
  State<StatefulWidget> createState() {
    return MePageState();
  }
}

class MePageState extends State<MePage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<listOfDoctors.length;i++){
      if(listOfDoctors[i].id=='$localId'){
        me = listOfDoctors[i];
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context){

    return doc != null ? DoctorPage(d: doc) : me==null?DoctorForm(): DoctorPage(d: me);
  }
}
