import 'package:doc_app/Data%20Modlels/doctor.dart';
import 'package:doc_app/screens/doctor_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Constants.dart';

class DocListItem extends StatefulWidget {

  Doctor d;

  DocListItem(Doctor d) {
    this.d = d;
  }

  @override
  State<StatefulWidget> createState() {
    return DocListItemState(d);
  }

}

class DocListItemState extends State<DocListItem> {
  Doctor d;
  String avatarImageLocation = 'assets/images/avatar.png';
  String docPhoneNum = "98xxxxxxxx";

  DocListItemState(Doctor d) {
    this.d = d;
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => DoctorPage(d: d)));
      },
      child: Column(
        children: [
          Container(
            child: Material(
              child: Padding(
                padding: const EdgeInsets.only(left:8.0, right: 8.0, bottom: 4.0, top: 4.0),
                child: Card(
                  elevation: 1,
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
                          child: Text(
                            d.available==true?'Available': 'Not Available',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );

  }

}