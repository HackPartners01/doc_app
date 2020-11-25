import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class text_card extends StatelessWidget {
  const text_card({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}