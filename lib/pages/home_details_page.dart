import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';
import '../widgets/theme.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [
            "\$${catalog.price}".text.xl4.red700.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to cart".text.make())
                .wh(120, 50)
          ],
        ).p24(),
      ),
      body: SafeArea(
        child: Column(children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image).centered().expand())
              .h32(context),
          Expanded(
              child: VxArc(
            height: 30.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color: Colors.white,
              width: context.screenWidth,
              child: Column(
                children: [
                  catalog.name.text.xl4.bold
                      .color(MyTheme.NaviBlueColor)
                      .make()
                      .py(38),
                  catalog.desc.text.xl.make(),
                  10.heightBox,
                  "Eos lorem magna lorem voluptua vero sanctus et dolores sit, et sea at consetetur sit sadipscing. Sed et magna magna stet aliquyam est invidunt nonumy. Dolor nonumy elitr et erat sea erat sed. Lorem gubergren ea nonumy sed. Ea ut nonumy sadipscing ipsum ut. Takimata sit duo eirmod dolore consetetur, ipsum ut et rebum amet, duo labore accusam amet rebum lorem erat. Accusam consetetur est et labore lorem et sit labore stet, lorem dolores sed dolore ut aliquyam lorem diam.."
                      .text
                      .make()
                      .p16()
                ],
              ),
            ),
          ))
        ]),
      ),
    );
  }
}
