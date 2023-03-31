import 'package:first_flutter_application/models/catalog.dart';

class CartModel {
  // singleton class
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel()=> cartModel;
  // ----------------
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
