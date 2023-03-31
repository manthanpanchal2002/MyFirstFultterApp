import 'package:first_flutter_application/Pages/home.dart';
import 'package:first_flutter_application/utils/routes.dart';
import 'package:first_flutter_application/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Pages/cart_page.dart';
import 'Pages/login.dart';
import 'core/store.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: MyApp()
    ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      // darkTheme: ThemeData(brightness: Brightness.dark),
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      debugShowCheckedModeBanner: false,
      // initialRoute: "/",
      initialRoute: MyRoutes.HomeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.CartRoute: (context) => CartPage()
      },
    );
  }
}
