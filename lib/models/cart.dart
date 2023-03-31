import 'package:velocity_x/velocity_x.dart';

import 'package:first_flutter_application/core/store.dart';
import 'package:first_flutter_application/core/store.dart';
import 'package:first_flutter_application/models/catalog.dart';

class CartModel {
  late CatalogModels _catalog;
  final List<int> _itemId = [];
  CatalogModels get catalog => _catalog;
  set catalog(CatalogModels newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

// get items in cart
  List<Item> get items => _itemId.map((id) => _catalog.getById(id)).toList();

// get total
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

// add item
  void add(Item item) {
    _itemId.add(item.id);
  }

// remove item
  void remove(Item item) {
    _itemId.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemId.add(item.id);
  }
}
