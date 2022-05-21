import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import "package:art_sweetalert/art_sweetalert.dart";
import '../core/store.dart';
import '../models/cart.dart';

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

//! bottom cart total with add to cart button !
class _cartTotal extends StatefulWidget {
  const _cartTotal({Key? key}) : super(key: key);

  @override
  State<_cartTotal> createState() => _cartTotalState();
}

class _cartTotalState extends State<_cartTotal> {
  @override
  Widget build(BuildContext context) {
    //important thing for useing VxBuilder
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
        height: 200,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          //price
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, store, status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.colorScheme.secondary)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    if (_cart.totalPrice != 0) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: "Thanks for shopping!".text.make()));

                      //* dialogBox of order placed
                      orderDoneAlertDialog(context);
                      _cart.allItemR;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: "opss! You forgot to add something!"
                              .text
                              .make()));
                    }
                  },
                  child: "Buy".text.white.make())
              .w32(context)
        ]));
  }

  void orderDoneAlertDialog(BuildContext context) {
    //get exits from cart page
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }

    //? dialog box get show!
    ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            title: "Order Placed",
            type: ArtSweetAlertType.success,
            // barrierColor: color.theme.canvasColor,
            confirmButtonColor: Colors.blue));
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                      onPressed: () => RemoveMutation(_cart.items[index]),
                      icon: Icon(Icons.remove_circle_outline_rounded)),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
