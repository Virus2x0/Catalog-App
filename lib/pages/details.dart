import "package:flutter/material.dart";

import '../widgets/drawer.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details Page"),
        ),
        body: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context,index){
            return ItemW
          }
        )
        drawer: DrawerMenu()
        );
  }
}
