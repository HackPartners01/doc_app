import 'package:flutter/material.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }
enum Commands { heroAndScholar, hurricaneCame }

class DoctorForm extends StatelessWidget {
  // static Seller seller;
  //
  // SellPage2(Seller sellerInfo) {
  //   seller = sellerInfo;
  // }

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
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String dropdownValue = 'Choose Category';
    var _selection;
    bool _heroAndScholar;

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
                    // prefixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (name) {
                    if (name.isEmpty) return 'Please Enter Your Name';
                    return null;
                  },
                  // onSaved: (val) => _product.name = val //TODO
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Expanded(
                child: TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Contact Number',
                    // prefixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (name) {
                    if (name.isEmpty) return 'Please Enter Your Contact Number';
                    return null;
                  },
                  // onSaved: (val) => _product.name = val //TODO
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Expanded(
                child: TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Address',
                    // prefixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (name) {
                    if (name.isEmpty) return 'Please Enter Your Address';
                    return null;
                  },
                  // onSaved: (val) => _product.name = val //TODO
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Expanded(
                child: TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    labelText: 'Types of Emergency You can Handle',
                    // prefixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                    suffix: PopupMenuButton<WhyFarther>(
                      icon: Icon(Icons.arrow_drop_down),
                      onSelected: (WhyFarther result) {
                        setState(() {
                          _selection = result;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<WhyFarther>>[
                        const PopupMenuItem<WhyFarther>(
                          value: WhyFarther.harder,
                          child: Text('Working a lot harder'),
                        ),
                        const PopupMenuItem<WhyFarther>(
                          value: WhyFarther.smarter,
                          child: Text('Being a lot smarter'),
                        ),
                        const PopupMenuItem<WhyFarther>(
                          value: WhyFarther.selfStarter,
                          child: Text('Being a self-starter'),
                        ),
                        const PopupMenuItem<WhyFarther>(
                          value: WhyFarther.tradingCharter,
                          child: Text('Placed in charge of trading charter'),
                        ),
                      ],
                    ),
                  ),
                  validator: (name) {
                    if (name.isEmpty) return 'Required Field';
                    return null;
                  },
                  // onSaved: (val) => _product.name = val //TODO
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Expanded(
                child: TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    labelText: 'Enter the Institute Name on Your Certification',
                    // prefixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (name) {
                    if (name.isEmpty) return 'Please Enter Your Address';
                    return null;
                  },
                  // onSaved: (val) => _product.name = val //TODO
                ),
              ),
            ),
            PopupMenuButton<Commands>(
              onSelected: (Commands result) {
                switch (result) {
                  case Commands.heroAndScholar:
                    setState(() {
                      _heroAndScholar = !_heroAndScholar;
                    });
                    break;
                  case Commands.hurricaneCame:
                    // ...handle hurricane option
                    break;
                  // ...other items handled here
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Commands>>[
                CheckedPopupMenuItem<Commands>(
                  checked: _heroAndScholar,
                  value: Commands.heroAndScholar,
                  child: const Text('Hero and scholar'),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<Commands>(
                  value: Commands.hurricaneCame,
                  child: ListTile(
                      leading: Icon(null), title: Text('Bring hurricane')),
                ),
                // ...other items listed here
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text('Submit Certificate Image for Verification'),
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form.validate()) {
                    form.save();
                    // _product.sellerId = DoctorForm.seller.id;
                    // Scaffold.of(context).showSnackBar(SnackBar(
                    //     content: Text(
                    //         'Product ${_product.name} added successfully to seller ${DoctorForm.seller.name}\'\ account')));

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ImageTaking(_product),
                    //   ),
                    // );
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
