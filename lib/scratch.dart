import 'package:firebase_database/firebase_database.dart';

void run() {
  final DatabaseReference dBRef = FirebaseDatabase.instance.reference();
  void writeData() async {
    dBRef.child('list').push().set({
      'id': 'id1',
      'name': 'Dr. Verma',
    });
  }

  void readData() {
    dBRef.child('Products').once().then((DataSnapshot snapshot) {
      Map data = snapshot.value;
      print(data);
      data.forEach((key, value) {
        print(value);
      });
    });
  }

  // writeData();

  // void someFunction() {
  //   List<Seller> sellerList = [
  //     Seller(name: 'name1', contact: 1),
  //     Seller(name: 'name2', contact: 2),
  //   ];
  //
  //   print(sellerList[0]);
  // }

// print(data.productList[0].name);
// readData();
// BodySectionContent bodySectionContent =
//   //     BodySectionContent('All Products', data.productList);
//   // bodySectionContent.save();
//   print({location.latitude, location.longitude});
}
