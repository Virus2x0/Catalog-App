// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

// import "package:flutter/material.dart";
// import 'package:flutter_for_trial/details.dart';
// import 'package:flutter_for_trial/samplepages.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: "BottomNag App",
//     home: BottomMenu(),
//   ));
// }

// class BottomMenu extends StatefulWidget {
//   BottomMenu({Key? key}) : super(key: key);

//   @override
//   State<BottomMenu> createState() => _BottomMenuState();
// }

// class _BottomMenuState extends State<BottomMenu> {
//   final _pagesData = [
//     const HomePage(),
//     const AboutPage(),
//     const ServicesPage()
//   ];

//   int _selectItem = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Trial App")),
//         body: Column(
//           children: <Widget>[
//             //Center(
//             //child: _pagesData[_selectItem],
//             // ),
//             Center(
//               child: ElevatedButton(
//                   child: Text(
//                     "Click here",
//                     style: TextStyle(fontSize: 25.0),
//                   ),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => DetailsPage()));
//                   }),
//             )
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//             BottomNavigationBarItem(icon: Icon(Icons.info), label: "About us"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.cleaning_services), label: "Services"),
//           ],
//           currentIndex: _selectItem,
//           onTap: (setValue) {
//             setState(() {
//               _selectItem = setValue;
//             });
//           },
//         ));
//   }
// }
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import "package:flutter/material.dart";
import 'package:flutter_for_trial/details.dart';
import 'package:flutter_for_trial/samplepages.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "BottomNag App",
    home: BottomMenu(),
  ));
}

class BottomMenu extends StatefulWidget {
  BottomMenu({Key? key}) : super(key: key);

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  final _pagesData = [
    const HomePage(),
    const AboutPage(),
    const ServicesPage()
  ];

  int _selectItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Trial App")),
        body: Column(
          children: <Widget>[
            // Center(
            //   child: _pagesData[_selectItem],
            // ),
            Center(
              child: ElevatedButton(
                  child: Text(
                    "Click here",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailsPage()));
                  }),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: "About us"),
            BottomNavigationBarItem(
                icon: Icon(Icons.cleaning_services), label: "Services"),
          ],
          currentIndex: _selectItem,
          onTap: (setValue) {
            setState(() {
              _selectItem = setValue;
            });
          },
        ));
  }
}
