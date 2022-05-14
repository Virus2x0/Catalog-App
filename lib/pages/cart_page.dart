import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
      ),
      body: Column(children: [
        _CartList().p32().expand(),
        Divider(),
        _cartTotal(),
      ]),
    );
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          "\$9999".text.xl5.color(context.accentColor).make(),
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying is not supported yet.".text.make()));
                  },
                  child: "Buy".text.white.make())
              .w32(context)
        ]));
  }
}

class _CartList extends StatefulWidget {
  _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_circle_outline_rounded)),
              title: "Item 1".text.make(),
            ));
  }
}
