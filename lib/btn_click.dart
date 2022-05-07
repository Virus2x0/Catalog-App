import "package:flutter/material.dart";
import 'package:flutter_for_trial/details.dart';
import 'package:flutter_for_trial/samplepages.dart';

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

  var dropdownCallBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Trial App")),
        body: Column(
          children: [
            SizedBox(
              height: 150.0,
              child: Center(
                child: _pagesData[_selectItem],
              ),
            ),
            SizedBox(
              height: 120.0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(30.0, 15.0),
                    textStyle: TextStyle(fontSize: 28),
                  ),
                  child: Text(
                    "Click here2",
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailsPage()));
                  }),
            ),
            // Expanded(
            //     child: DropdownButton(
            //   items: const [
            //     DropdownMenuItem(child: Text("first"), value: "first"),
            //     DropdownMenuItem(child: Text("second"), value: "seconf")
            //   ],
            //   onChanged: dropdownCallBack,
            // )
            // )
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
