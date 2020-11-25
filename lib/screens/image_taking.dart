import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_app/components/image_capture.dart';
import 'package:main_app/data_models/product.dart';

class ImageTaking extends StatefulWidget {
  Product p;
  ImageTaking(Product p) {
    this.p = p;
  }

  @override
  State<StatefulWidget> createState() {
    return ImageTakingState(p);
  }
}

class ImageTakingState extends State<ImageTaking> {
  Product p;
  ImageTakingState(Product p) {
    this.p = p;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
        child: Column(
          children: [
            ImageCaptureWidget(p),
          ],
        ),
      ),
    );
  }
}
