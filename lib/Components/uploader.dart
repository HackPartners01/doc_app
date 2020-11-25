import 'dart:io';

import 'package:doc_app/Data%20Modlels/doctor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Uploader extends StatefulWidget {
  final File file;
  Doctor d;

  Uploader({Key key, this.file, this.d}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UploaderState(file, d);
  }
}

class UploaderState extends State<Uploader> {
  File file;
  Doctor d;

  UploaderState(File file, Doctor d) {
    this.file = file;
    this.d = d;
  }

  FirebaseStorage _storage = FirebaseStorage(
      storageBucket: 'gs://hackshetra2020-85555.appspot.com');
  UploadTask task;
  String downloadUrl;

  void startUpload() {
    String filePath = 'DocImages/${DateTime.now()}.png';
    Reference ref = _storage.ref().child(filePath);
    task = ref.putFile(widget.file);
    task.whenComplete(() async => {
      downloadUrl = await ref.getDownloadURL().then((value) => downloadUrl = value),
      d.networkImageAddress = downloadUrl,
      d.save(),
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('file uploaded succesfully'))),
      //TODO go somewhere
    });

  }

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      label: Text('Save Image'),
      icon: Icon(Icons.save),
      onPressed: startUpload,
    );
  }
}
