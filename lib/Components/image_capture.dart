import 'dart:io';
import 'package:doc_app/Components/uploader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doc_app/Data Modlels/doctor.dart';

class ImageCaptureWidget extends StatefulWidget {
  Doctor d;
  ImageCaptureWidget(Doctor d) {
    this.d = d;
  }

  @override
  State<StatefulWidget> createState() {
    return ImageCaptureState(d);
  }
}

class ImageCaptureState extends State<ImageCaptureWidget> {
  //active image file
  Doctor d;
  ImageCaptureState(Doctor d) {
    this.d = d;
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
                            'Please upload a profile piture so that patients can recognize you at the time of emergency',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Row(
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
                  Uploader(file: imageFile, d: d)
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
