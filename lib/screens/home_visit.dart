
//TODO koi bhi or page khole to ye original state pe aaje, khula hua doctor page na rahe...



import 'package:doc_app/Components/doc_list_item.dart';
import 'package:doc_app/Constants.dart';
import 'package:flutter/cupertino.dart';

class HomeVisit extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeVisitState();
  }

}

class HomeVisitState extends State<HomeVisit> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0, bottom: 16.0),
      child: ListView(
        children: [
          for(int i=0;i<listOfDoctors.length;i++) DocListItem(listOfDoctors[i])
        ],
      ),
    );
  }

}