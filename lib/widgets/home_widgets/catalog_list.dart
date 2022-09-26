import 'package:flutter_for_trial/pages/home_details_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import '../../models/catalog.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

//! Catalog listView.builder here
class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap:
          true, //! If you do not set the shrinkWrap property, your ListView will be as big as its parent.

      itemCount: CatalogModel
          .items?.length, //  No. of items in the list from Catalog.dart
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
            // whole card will be clickable
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailsPage(
                          catalog: catalog,
                          // goes on as per the index num of product
                        ))),
            child: CatalogItem(catalog: catalog));
        // Returns how a one card or thing gonna appear // kind of listTile get returns
      },
    );
  }
}

//? *****************************************************************************

//! Decoreting a single card in list!

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        // a card of a product on home page!
        child: Row(
      children: [
        Hero(
            // !  here catalog is used as parametrer and it is a index of a product
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.bold.color(context.accentColor).make(),
            catalog.desc.text.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                "\$${catalog.price}".text.bold.make(),
                AddToCart(catalog: catalog)
              ],
            )
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py(16); // a box in
  }
}
