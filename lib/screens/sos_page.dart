import 'package:flutter/material.dart';

import 'package:doc_app/constants.dart';

class SOSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorLightGrey,
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.fromLTRB(0, 0, 5.0, 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('6',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold)),
                        Text('Doctors Found Nearby'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('6',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold)),
                        Text('Doctors Found Nearby'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: name(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('6',
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold)),
                  Text('Doctors Found Nearby'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class name extends StatelessWidget {
  const name({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Expanded(child: Container(child: Text('Request Assistance'))),
    );
  }
}
