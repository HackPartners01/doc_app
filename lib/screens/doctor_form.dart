import 'package:doc_app/Data%20Modlels/doctor.dart';
import 'package:flutter/material.dart';

import 'imageTaking.dart';

class DoctorForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoctorFormElements(),
    );
  }
}

class DoctorFormElements extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DoctorFormElementsState();
  }
}

class DoctorFormElementsState extends State<DoctorFormElements> {

  Doctor d = Doctor();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
              child: Expanded(
                child: TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Name',
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (name) {
                    if (name.isEmpty) return 'Please Enter Your Name';
                    return null;
                  },
                   onSaved: (val) => d.name = val
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Expanded(
                child: TextFormField(
                  autocorrect: true,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Contact Number',
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (name) {
                    if (name.isEmpty) return 'Please Enter Your Contact Number';
                    return null;
                  },
                  onSaved: (val) => d.phn = val
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Expanded(
                child: TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Highest medical degree',
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (name) {
                    if (name.isEmpty) return 'Please Enter Your Highest Degree';
                    return null;
                  },
                  onSaved: (val) => d.degree = val //TODO
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text('Submit Certificate Image for Verification'),
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form.validate()) {
                    form.save();
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageTaking(d),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
