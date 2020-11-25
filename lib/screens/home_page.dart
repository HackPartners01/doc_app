import 'package:flutter/material.dart';

import 'package:doc_app/components/side_nav_drawer.dart';
import 'package:doc_app/components/body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideNavDrawer(),
      appBar: AppBar(
        title: Text('DocApp'),
      ),
      body: Body(),
    );
  }
}
