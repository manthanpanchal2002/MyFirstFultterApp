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

}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemId.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemId.remove(item.id);
  }
}
