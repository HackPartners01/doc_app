import 'package:flutter/material.dart';

import 'package:doc_app/constants.dart';
import 'package:doc_app/components/text_card.dart';

class SOSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int numDoctorsNearby = 6;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: TextCard(
                    margin: EdgeInsets.fromLTRB(0, 0, 5.0, 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('$numDoctorsNearby',
                            style: TextStyle(
                                fontSize: 90.0, fontWeight: FontWeight.bold)),
                        Text('Doctors Found Nearby', textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TextCard(
                    margin: EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('2',
                            style: TextStyle(
                                fontSize: 90.0, fontWeight: FontWeight.bold)),
                        Text('Hospitals Found Nearby', style: TextStyle(), textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: TextCard(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryDropdown(),
                  Container(
                    height: 110.0,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: kColorOrange,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        child: Text(
                          'Request Assistance',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 34.0),
                        ),
                        onTap:
                            () {}, // TODO : Add function to request assistance
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextCard(
              margin: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('500 INR',
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold)),
                  Text('Assistance Fee'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDropdown extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<CategoryDropdown> {
  static String dropdownValue = 'Choose Category';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        elevation: 16,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>[
          'Choose Category',
          'Cardiac Arrest',
          'Trauma/Injury',
          'Pregnancy Related',
          'Breathing Issue',
          'Intoxication',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
