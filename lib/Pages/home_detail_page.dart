import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:first_flutter_application/models/catalog.dart';
import 'package:first_flutter_application/models/catalog.dart';
import 'package:first_flutter_application/utils/routes.dart';
import 'package:first_flutter_application/widgets/themes.dart';

import '../models/cart.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ).pOnly(left: 0.0, right: 0.0, top: 0.0, bottom: 250),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: MyTheme.creamColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\₹${catalog.price}".text.bold.xl3.make(),
            10.heightBox,
            _AddToCart(catalog:catalog).wh(150, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.asset(catalog.image))
                  .h32(context)
                  .fittedBox()
                  .centered(),
              Expanded(
                  child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: MyTheme.creamColor,
                  child: Column(
                    children: [
                      "\ ${catalog.name}".text.xl4.bold.make(),
                      "\ ${catalog.desc}"
                          .text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "Dolor aut explicabo omnis odit.Dolor aut explicabo omnis odit.Dolor aut explicabo omnis odit.Dolor aut explicabo omnis odit."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                    ],
                  ).py64(),
                ),
              ))
            ],
          )),
    );
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool IsAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          IsAdded = IsAdded.toggle();
          final _catalog = CatalogModels();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white),
            backgroundColor: MaterialStatePropertyAll(Colors.black),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: IsAdded ? Icon(Icons.done) : "Add to cart".text.make());
  }
}
