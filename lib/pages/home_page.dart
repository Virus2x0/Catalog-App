// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';

import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }
  //read it again!

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');
    //untill the json file gets load it will wait

    final decodeData = jsonDecode(catalogJson);
    //decodeing data ...string to dynamic value basically dynamic value stays as Map
    final productsData = decodeData["products"];
    //encodung Map to String value! ....why that need to fined!!!!

    CatalogModel.items = List.from(productsData)
        //got list from catalog item then ..made list from product data...the product data gives dynamic value
        //so used map
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    //to list is imp to make it list again! from dynamic value

    //without setState it wont render other card expect 1st one!
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Catalog App"),
        ),
        //Padding for card list!
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: (CatalogModel.items != null)
                ? ListView.builder(
                    itemCount: CatalogModel.items?.length,
                    itemBuilder: (context, index) => ItemWidget(
                          item: CatalogModel.items![index],
                        ))
                : Center(
                    child: CircularProgressIndicator(),
                  )),
        drawer: DrawerMenu());
  }
}
