import 'package:first_flutter_application/Pages/home_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModels.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModels.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "\ ${catalog.name}".text.xl.bold.make(),
            "\ ${catalog.desc}".text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\₹${catalog.price}".text.bold.xl.make(),
                10.heightBox,
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 10)
          ],
        ))
      ],
    )).white.rounded.square(100).make().py16();
  }
}
