import 'package:flutter_for_trial/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartModel {
  //singleton model

  //catalog filed
  late CatalogModel _catalog; // created a model

  //collection of Ids -- Stores id of each item.
  final List<int> _itemIds = []; //list of ids //array

//custom setter
// //? catalog will take a input
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

//   // get catalog!
//   // custom gertter
//   // ? catalog will give out put of setter

  CatalogModel get catalog => _catalog;

  // get items in cart
  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();

  //change in price!
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //removie item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
