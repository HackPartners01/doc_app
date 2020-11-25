import 'package:flutter/material.dart';

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
    // final _product = Product();

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
