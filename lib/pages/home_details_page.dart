import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';
import '../widgets/theme.dart';

class HomeDetailsPage extends StatefulWidget {
  final Item catalog;
  const HomeDetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  bool addToCartButtonChange = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(backgroundColor: Colors.transparent), //app bar
      bottomNavigationBar: Container(
        // bottom price indicator
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment
              .spaceBetween, //spaceBetween will make item to set at corner of page
          buttonPadding: Vx.mH8, //! ??
          children: [
            "\$${widget.catalog.price}".text.xl4.red700.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to cart".text.make())
                .wh(120, 50) // width and height
          ],
        ).p24(),
      ),
      body: SafeArea(
        child: Column(children: [
          Hero(
                  // Hero used for animation here
                  //Hero Required tag ...which contyails key!
                  tag: Key(widget.catalog.id.toString()),
                  child:
                      Image.network(widget.catalog.image).centered().expand())
              .h32(context), // height 32

          //Space below Image
          Expanded(
              child: VxArc(
            // * For Curve...
            height: 30.0,
            arcType: VxArcType
                .CONVEY, // conve"y" for "U" drop and Conve"X" for reverse "U"
            edge: VxEdge.TOP, // curve will be on top
            child: Container(
              color: context.cardColor,
              width: context.screenWidth,
              child: Column(
                children: [
                  widget.catalog.name.text.xl4
                      .bold //widget to use text as widget...
                      .color(context.accentColor)
                      .make()
                      .py(38), //padding only on Y axis 38
                  widget.catalog.desc.text.xl.make(),
                  10.heightBox, //for blank space..
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
