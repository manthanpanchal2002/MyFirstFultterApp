import 'package:first_flutter_application/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changebutton = false;
  final _formKey = GlobalKey<FormState>();

  MoveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });

      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushNamed(context, MyRoutes.HomeRoute);

      setState(() {
        changebutton = false;
      });
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, top: 30.0, right: 30.0, bottom: 0.0),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username required";
                          } else {
                            return null;
                          }
                        },
                      ),

                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "", labelText: "Enter Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password required";
                          } else if (value.length < 8) {
                            return "Password must be greater than 8 characters";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 45.0,
                      ),
                      Material(
                        color: Colors.lightBlue,
                        borderRadius:
                            BorderRadius.circular(changebutton ? 50 : 5),
                        child: InkWell(
                          onTap: () => MoveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changebutton ? 46 : 100,
                            height: 45,
                            alignment: Alignment.center,
                            child: changebutton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "LogIn",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.HomeRoute);
                      //   },
                      //   child: Text("LogIn"),
                      //   style: TextButton.styleFrom(minimumSize: Size(100, 45)),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
