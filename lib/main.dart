import 'package:first_flutter_application/Pages/home.dart';
import 'package:flutter/material.dart';

import 'Pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      // initialRoute: "/",
      routes: {
        // "/": (context) => HomePage(),
        "/": (context) => LoginPage()
      },
    );
  }
}
