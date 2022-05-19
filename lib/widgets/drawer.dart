import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
// import 'package:url_launcher/url_launcher.'dart;
import '../pages/home_page_2.dart';
import '../pages/profile_page.dart';

class DrawerMenu extends StatefulWidget {
  DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    final ImageUrl =

        // ! try with menu item as well!!
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkS8v2vSpIzK2HCPWDdfZP3vbvQhEm5fxuwkNENSNSswbBoWScLb0h3GjVFqgZB9FEpSg&usqp=CAU";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Vivek Kadam",
                      style: TextStyle(color: Colors.white)),
                  accountEmail: Text("Vivekadam1332@gmail.com",
                      style: TextStyle(color: Colors.white)),
                  currentAccountPicture:
                      CircleAvatar(backgroundImage: NetworkImage(ImageUrl)),
                )),
            Material(
              color: Colors.transparent,
              child: ListTile(
                  leading: Icon(CupertinoIcons.home, color: Colors.white),
                  title: Text("Home",
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage2(),
                      ),
                    );
                  }),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                  leading:
                      Icon(CupertinoIcons.profile_circled, color: Colors.white),
                  title: Text("Profile",
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  }),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                leading: Icon(CupertinoIcons.mail, color: Colors.white),
                title: Text("Email Me",
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
