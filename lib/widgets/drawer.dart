import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class DrawerMenu extends StatefulWidget {
  DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    final ImageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkS8v2vSpIzK2HCPWDdfZP3vbvQhEm5fxuwkNENSNSswbBoWScLb0h3GjVFqgZB9FEpSg&usqp=CAU";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Vivek Kadam"),
                  accountEmail: Text("Vivekadam1332@gmail.com"),
                  currentAccountPicture:
                      CircleAvatar(backgroundImage: NetworkImage(ImageUrl)),
                )),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text("Home",
                  textScaleFactor: 1.5, style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading:
                  Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: Text("Profile",
                  textScaleFactor: 1.5, style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white),
              title: Text("Email Me",
                  textScaleFactor: 1.5, style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
