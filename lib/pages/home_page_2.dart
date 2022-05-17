import 'dart:convert';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_for_trial/models/cart.dart';
import 'package:flutter_for_trial/widgets/theme.dart';
import '../core/store.dart';
import '../models/catalog.dart';
import "package:velocity_x/velocity_x.dart";
import '../widgets/drawer.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'cart_page.dart';
import 'package:http/http.dart' as http;

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final url = "https://mocki.io/v1/a7088020-f73c-4bdc-851c-dc3db8a93fe6";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  //initState is used to see the data before intialization...
  //wherer we used loadData..

  loadData() async {
    //used async bcoz of await here... to perform await we need to sync the function as well
    //!  await Future.delayed(Duration(seconds: 2));
    final response = await http.get(Uri.parse(url));

    //await is used beacause that thing will take time to performe...and perforn later
    //! final catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    final catalogJson = response.body;
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
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,

      floatingActionButton: VxBuilder(
          builder: (ctx, store, status) => FloatingActionButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage())),
                child: Icon(CupertinoIcons.cart),
                backgroundColor: context.theme.buttonColor,
              ).badge(color: Vx.red600, size: 20, count: _cart.items.length),
          mutations: {AddMutation, RemoveMutation}),

      body: SafeArea(
        child: Container(
          padding: Vx.m32, //32 padding from all sides
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
      drawer: DrawerMenu(), // drawer menu from left side swipe
    );
  }
}
