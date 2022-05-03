import "package:flutter/material.dart";

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Details Page",
              style: TextStyle(
                fontSize: 25.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
