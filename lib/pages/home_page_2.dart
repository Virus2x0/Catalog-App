import 'dart:convert';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_for_trial/widgets/theme.dart';
import '../models/catalog.dart';
import "package:velocity_x/velocity_x.dart";
import '../widgets/drawer.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  //initState is used to see the data before intialization...
  //wherer we used loadData..

  loadData() async {
    //used async bcoz of await here... to perform await we need to sync the function as well
    await Future.delayed(Duration(seconds: 2));
    //await is used beacause that thing will take time to performe...and perforn later
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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            children: [
              CatalogHeader(), // Home page header with catalog app and sub line
              //condition for progressbaar
              if (CatalogModel.items != null &&
                  CatalogModel.items!.isNotEmpty) //if true Cataloglist visible
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      drawer: DrawerMenu(),
    );
  }
}
