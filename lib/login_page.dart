import "package:flutter/material.dart";
import 'package:flutter_for_trial/btn_click.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool buttonChange = false;

  final _formkey = GlobalKey<FormState>();

  Future moveToDashboard(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        buttonChange = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomMenu()));
      setState(() {
        buttonChange = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/file.png", fit: BoxFit.cover),

              // ignore: prefer_const_constructors

              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome, $name ",
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter UserName",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username can not be empty.";
                          }
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        }),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can not be empty.";
                        } else if (value.length < 6) {
                          return "Password need at least 6 characters.";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () => moveToDashboard(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: buttonChange ? 50 : 150.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        child: buttonChange
                            ? Icon(Icons.done, color: Colors.white)
                            : Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.5,
                                ),
                              ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.circular(buttonChange ? 50 : 8),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
