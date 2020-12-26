import 'package:doc_app/Constants.dart';
import 'package:doc_app/Data%20Modlels/doctor.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'imageTaking.dart';
import 'me_page.dart';

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

List<bool> check = [false, false, false, false, false];
Set<String> selected = {};

class DoctorFormElementsState extends State<DoctorFormElements> {
  Doctor d = Doctor();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Material(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
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
                      onSaved: (val) => {d.name = val.toUpperCase()}),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: TextFormField(
                      autocorrect: true,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Contact Number',
                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                        border: OutlineInputBorder(),
                      ),
                      validator: (name) {
                        if (name.isEmpty)
                          return 'Please Enter Your Contact Number';
                        return null;
                      },
                      onSaved: (val) => d.phn = val),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: TextFormField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Highest medical degree',
                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                        border: OutlineInputBorder(),
                      ),
                      validator: (name) {
                        if (name.isEmpty)
                          return 'Please Enter Your Highest Degree';
                        return null;
                      },
                      onSaved: (val) => d.degree = val.toUpperCase() //TODO
                      ),
                ),
                CategoryChips(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FlatButton(
                    color: kColorOrange,
                    textColor: kColorWhite,
                    child: Text('Submit'),
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form.validate()) {
                        form.save();
                        d.ch1 = check[0];
                        d.ch2 = check[1];
                        d.ch3 = check[2];
                        d.ch4 = check[3];
                        d.ch5 = check[4];
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
        ),
      ),
    );
  }
}

class CategoryChips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CategoryChipsState();
  }
}

class CategoryChipsState extends State<CategoryChips> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: FilterChip(
                label: Padding(
                  padding: EdgeInsets.all(check[0] ? 2.0 : 0.0),
                  child: Text('Cardiac Arrest'),
                ),
                backgroundColor: kColorLightGrey,
                selectedColor: kColorDarkGrey,
                labelStyle:
                    TextStyle(color: check[0] ? Colors.white : Colors.black),
                showCheckmark: true,
                checkmarkColor: kColorOrange,
                selected: check[0],
                onSelected: (bool value) {
                  if (value) {
                    selected.add('Cardiac Arrest');
                    setState(() {
                      check[0] = true;
                    });
                  } else {
                    selected.remove('Cardiac Arrest');
                    setState(() {
                      check[0] = false;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: FilterChip(
                backgroundColor: kColorLightGrey,
                selectedColor: kColorDarkGrey,
                labelStyle:
                    TextStyle(color: check[1] ? Colors.white : Colors.black),
                label: Padding(
                  padding: EdgeInsets.all(check[1] ? 2.0 : 0.0),
                  child: Text('Trauma/Injury'),
                ),
                showCheckmark: true,
                checkmarkColor: kColorOrange,
                selected: check[1],
                onSelected: (bool value) {
                  if (value) {
                    selected.add('Trauma/Injury');
                    setState(() {
                      check[1] = true;
                    });
                  } else {
                    selected.remove('Cardiac Arrest');
                    setState(() {
                      check[1] = false;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: FilterChip(
                backgroundColor: kColorLightGrey,
                selectedColor: kColorDarkGrey,
                labelStyle:
                    TextStyle(color: check[2] ? Colors.white : Colors.black),
                label: Padding(
                  padding: EdgeInsets.all(check[2] ? 2.0 : 0.0),
                  child: Text('Pregnancy Related'),
                ),
                showCheckmark: true,
                checkmarkColor: kColorOrange,
                selected: check[2],
                onSelected: (bool value) {
                  if (value) {
                    selected.add('Pregnancy Related');
                    setState(() {
                      check[2] = true;
                    });
                  } else {
                    selected.remove('Pregnancy Related');
                    setState(() {
                      check[2] = false;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: FilterChip(
                backgroundColor: kColorLightGrey,
                selectedColor: kColorDarkGrey,
                labelStyle:
                    TextStyle(color: check[3] ? Colors.white : Colors.black),
                label: Padding(
                  padding: EdgeInsets.all(check[3] ? 2.0 : 0.0),
                  child: Text('Breathing'),
                ),
                showCheckmark: true,
                checkmarkColor: kColorOrange,
                selected: check[3],
                onSelected: (bool value) {
                  if (value) {
                    selected.add('Breathing Issues');
                    setState(() {
                      check[3] = true;
                    });
                  } else {
                    selected.remove('Breathing Issues');
                    setState(() {
                      check[3] = false;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: FilterChip(
                backgroundColor: kColorLightGrey,
                selectedColor: kColorDarkGrey,
                labelStyle:
                    TextStyle(color: check[4] ? Colors.white : Colors.black),
                label: Padding(
                  padding: EdgeInsets.all(check[4] ? 2.0 : 0.0),
                  child: Text('Intoxication'),
                ),
                showCheckmark: true,
                checkmarkColor: kColorOrange,
                selected: check[4],
                onSelected: (bool value) {
                  if (value) {
                    selected.add('Intoxication');
                    setState(() {
                      check[4] = true;
                    });
                  } else {
                    selected.remove('Intoxication');
                    setState(() {
                      check[4] = false;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
