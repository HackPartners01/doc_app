import 'package:doc_app/Components/body.dart';
import 'package:doc_app/Components/map_live_location.dart';
import 'package:doc_app/Data%20Modlels/doctor.dart';
import 'package:doc_app/screens/doctor_form.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

import 'package:doc_app/components/text_card.dart';
import 'package:doc_app/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';

const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
// const LatLng SOURCE_LOCATION = LatLng(42.747932, -71.167889);
// const LatLng DEST_LOCATION = LatLng(37.335685, -122.0605916);

class DoctorPage extends StatefulWidget {
  Doctor d;
  DoctorPage({this.d});

  @override
  State<StatefulWidget> createState() {
    return DoctorPageState(d);
  }

}

class DoctorPageState extends State<DoctorPage>{

  Doctor d;
  DoctorPageState(this.d);

  @override
  Widget build(BuildContext context) {
    for(int i=0;i<listOfDoctors.length;i++){
      if(listOfDoctors[i].id=='$localId'){
        me = listOfDoctors[i];
        break;
      }
    }
    String avatarImageLocation = 'assets/images/avatar.png';
    String docPhoneNum = "98xxxxxxxx";
    String dropdownValue = 'Available';

    return Scaffold(
        body: MaterialApp(
          color: Colors.white,
          theme: ThemeData(
            fontFamily: 'Comfortaa',
            primaryColor: kColorDarkGrey,
            accentColor: kColorOrange,
          ),
          debugShowCheckedModeBanner: false,
          home: Column(
            children: [
              Container(
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(color: kColorLightGrey),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    backgroundImage: d == null
                                        ? AssetImage(avatarImageLocation)
                                        : NetworkImage(d.networkImageAddress),
                                    radius: 50.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(d != null
                                          ? 'DR. ${d.name}'
                                          : 'DR. ABHIMANYU ROY', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(d != null ? '${d.degree}' : 'MBBS'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(d == null ? '$docPhoneNum' : d.phn),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child:
                              me!=null && d!=null && d.id == me.id? DropDownAvailable()
                                  :Text(d.available==true?'Available': 'Not Available',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 0.0),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Alerted nearby hospitals for ambulance assistance.',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Getting Responses...',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: kColorLightGrey,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(child: MapLiveLocation()),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: LayoutBuilder(
          builder: (context,constraints){
            if(me!=null && d!=null && d.id == me.id) return FloatingActionButton(
              backgroundColor: kColorOrange,
              onPressed: () async {
                logout();
                Navigator.push(context, MaterialPageRoute(builder:(context)=> DoctorForm()));
              },
              child: Icon(Icons.logout, color: Colors.white,),
            );
            else return Container();
          },
        )
    );
  }

  logout() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'doc_id';
    prefs.setString(key, null);
    me = null;
  }
}

class DropDownAvailable extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DropDownAvailableState();
  }

}

class DropDownAvailableState extends State<DropDownAvailable>{
  String dropdownValue = 'Available';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: TextStyle(
          color: kColorDarkGrey,
      ),
      underline: Container(
        height: 2,
        color: kColorOrange,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Available', 'Not Available']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, textAlign: TextAlign.center,),
          onTap: (){
            DatabaseReference db = FirebaseDatabase.instance.reference().child("Doctors");
            db.once().then((DataSnapshot snapshot){

              Map<dynamic, dynamic> values = snapshot.value;
              values.forEach((key,values) {

                if(values['id']==me.id){

                  if(value=='Available'){
                    values['available'] = true;
                  }
                  else values['available'] = false;

                }

              }
              );
              db.update(values);

            });

          },
        );
      }).toList(),
    );
  }

}
