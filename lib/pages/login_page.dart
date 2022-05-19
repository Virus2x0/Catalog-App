import "package:flutter/material.dart";
import 'package:flutter_for_trial/pages/home_page_2.dart';
import 'package:velocity_x/velocity_x.dart';

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
          context, MaterialPageRoute(builder: (context) => HomePage2()));
      setState(() {
        buttonChange = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.canvasColor,
      child: SingleChildScrollView(
        //singlechildScollView gives scrollablity to the small devices~
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/LogIn_hey.png", fit: BoxFit.cover),
              // used sizebox for spacing between two widgets
              SizedBox(
                height: 20.0,
              ),
              //Welcome Text
              "Welcome $name".text.size(30).make(),
              SizedBox(
                height: 20.0,
              ),
              // TextFormField from here...
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
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
                    Material(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.circular(buttonChange ? 50 : 8),
                      child: InkWell(
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
