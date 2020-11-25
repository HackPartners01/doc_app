mport 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_app/components/uploader.dart';
import 'package:main_app/data_models/product.dart';

class ImageCaptureWidget extends StatefulWidget {
  Product p;
  ImageCaptureWidget(Product p) {
    this.p = p;
  }

  @override
  State<StatefulWidget> createState() {
    return ImageCaptureState(p);
  }
}

class ImageCaptureState extends State<ImageCaptureWidget> {
  //active image file
  Product p;
  ImageCaptureState(Product p) {
    this.p = p;
  }
  static File imageFile;

  //Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      imageFile = selected;
    });
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(sourcePath: imageFile.path);

    setState(() {
      imageFile = cropped ?? imageFile;
    });
  }

  void clear() {
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                          width: 250.0,
                          child: Text(
                            'Please submit one image of the product',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: Colors.black12),
                        child: IconButton(
                          icon: Icon(Icons.camera),
                          onPressed: () {
                            _pickImage(ImageSource.camera);
                          },
                        ),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: Colors.black12),
                        child: IconButton(
                          icon: Icon(Icons.photo_library_outlined),
                          onPressed: () {
                            _pickImage(ImageSource.gallery);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                if (imageFile != null) ...[
                  Image.file(imageFile),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.crop),
                        onPressed: _cropImage,
                      ),
                      IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: clear,
                      )
                    ],
                  ),
                  Uploader(file: imageFile, p: p)
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
