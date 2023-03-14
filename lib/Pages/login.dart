import 'package:first_flutter_application/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, top: 30.0, right: 5.0, bottom: 0.0),
                child: Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome Buddyyy!!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.lightBlue),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "", labelText: "Enter Username"),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "", labelText: "Enter Password"),
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.HomeRoute);
                      },
                      child: Text("LogIn"),
                      style: TextButton.styleFrom(minimumSize: Size(100, 45)),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
