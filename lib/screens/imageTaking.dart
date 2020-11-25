import 'package:doc_app/Components/image_capture.dart';
import 'package:doc_app/Data%20Modlels/doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ImageTaking extends StatefulWidget{

  Doctor d;
  ImageTaking(Doctor d){
    this.d = d;
  }

  @override
  State<StatefulWidget> createState() {
    return ImageTakingState(d);
  }

}

class ImageTakingState extends State<ImageTaking>{
  Doctor d;
  ImageTakingState(Doctor p){
    this.d = p;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
        child: Column(
          children: [
            ImageCaptureWidget(d),
          ],
        ),
      ),
    );
  }

}