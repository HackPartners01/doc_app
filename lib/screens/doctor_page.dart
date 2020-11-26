import 'package:doc_app/Components/map_live_location.dart';
import 'package:doc_app/Data%20Modlels/doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:doc_app/components/text_card.dart';
import 'package:doc_app/constants.dart';

const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(42.747932, -71.167889);
const LatLng DEST_LOCATION = LatLng(37.335685, -122.0605916);

class DoctorPage extends StatelessWidget {

  Doctor d;
  DoctorPage({this.d});

  @override
  Widget build(BuildContext context) {
    String avatarImageLocation = 'assets/images/avatar.png';
    int timeToReach = 10;
    String docPhoneNum = "98xxxxxxxx";

    return Column(
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
                              backgroundImage: d==null?AssetImage(avatarImageLocation):NetworkImage(d.networkImageAddress),
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
                                child: Text(d!=null?'Dr.${d.name}':'Dr.Abhinamyu Roy'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(d!=null?'${d.degree}':'MBBS'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(d==null?'$docPhoneNum': d.phn),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Available in $timeToReach minutes',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: kColorLightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: MapLiveLocation()
              ),
            ),
          ),
        )
      ],
    );
  }
}
