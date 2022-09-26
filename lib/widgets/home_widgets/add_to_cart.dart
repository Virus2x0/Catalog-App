import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/store.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //* watch used for state management it gets context and

    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    // if a _cart item consist any item then then isInCart true or else remain false...

    bool isInCart = _cart.items.contains(catalog);

    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
          StadiumBorder(),
        )),
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);

            // setState(() {});
          } else if (isInCart) {
            RemoveMutation(catalog);
          }
        },
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
