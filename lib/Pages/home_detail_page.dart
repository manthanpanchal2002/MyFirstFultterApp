import 'package:first_flutter_application/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:first_flutter_application/models/catalog.dart';
import 'package:first_flutter_application/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.creamColor,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\₹${catalog.price}".text.bold.xl3.make(),
          10.heightBox,
          ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  child: "Buy".text.make())
              .wh(100, 50)
        ],
      ).p32(),
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
                    ],
                  ).py64(),
                ),
              ))
            ],
          )),
    );
  }
}
