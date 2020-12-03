import 'dart:io';

import 'package:doc_app/Constants.dart';
import 'package:doc_app/Data%20Modlels/doctor.dart';
import 'package:doc_app/screens/doctor_page.dart';
import 'package:doc_app/screens/me_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


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

  FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://hackshetra2020-85555.appspot.com');
  UploadTask task;
  String downloadUrl;

  void startUpload() {
    String filePath = 'DocImages/${DateTime.now()}.png';
    Reference ref = _storage.ref().child(filePath);
    task = ref.putFile(widget.file);
    task.whenComplete(() async => {
          downloadUrl =
              await ref.getDownloadURL().then((value) => downloadUrl = value),
          d.networkImageAddress = downloadUrl,
          d.save(),
          insertDocToDB(d),
          Scaffold.of(this.context).showSnackBar(
              SnackBar(content: Text('Details Saved Successfully'))),
          Navigator.push(
              this.context, MaterialPageRoute(builder: (context) => MePage(d: d))),
        });
  }


  Future<void> insertDocToDB(Doctor doc) async {
    // Get a reference to the database.
    final Database database = await dbConst;

    await database.insert(
      'docTable',
      doc.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print("${doc.toMap()}vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
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
