import 'package:doc_app/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorPage extends StatelessWidget{

  String avatarImageLocation = 'assets/images/avatar.png';
  int timeToReach = 10;
  String docPhoneNum = "98xxxxxxxx";


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Material(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: kColorLightGrey
                ),
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
                              backgroundImage: AssetImage(avatarImageLocation),
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
                                child: Text('Dr. DrfName DrlName'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('MBBS/ MD from FALANA'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('$docPhoneNum'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Available in $timeToReach minutes', style: TextStyle(fontSize: 20),),
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
                  child: Text('Alerted nearby hospitals for ambulance assistance.', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Getting Responses...',),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

}
