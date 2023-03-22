import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  int age = 21;
  String name = "Manthan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Center(
        child: Container(
          child: Text("Hey! It's $name here and I'm $age years old 👨🏻‍💻"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
