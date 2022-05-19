import 'package:flutter/material.dart';
import 'package:flutter_for_trial/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class Dj extends StatelessWidget {
  final Item catalog;
  const Dj({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
            child: Column(
          children: [
            catalog.name.text.make(),
            catalog.desc.text.make(),
            ButtonBar(
              children: [
                catalog.name.text.make(),
                catalog.desc.text.make(),
              ],
            )
          ],
        ))
      ],
    )).rounded.make();
  }
}
