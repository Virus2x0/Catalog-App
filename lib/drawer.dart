import "package:flutter/material.dart";

class DrawerMenu extends StatefulWidget {
  DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cap app"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to abc"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
