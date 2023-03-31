import 'package:first_flutter_application/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:vxstate/src/vxstate.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModels _catalog = (VxState.store as MyStore).catalog;
    bool IsAdded = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!IsAdded) {
            // IsAdded = IsAdded.toggle();
            // final _catalog = CatalogModels();
            // _cart.catalog = _catalog;
            // _cart.add(catalog);
            AddMutation(catalog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white),
            backgroundColor: MaterialStatePropertyAll(Colors.black),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: IsAdded ? Icon(Icons.done) : "Add to cart".text.make());
  }
}
