import 'dart:convert';

import 'package:first_flutter_application/core/store.dart';
import 'package:first_flutter_application/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:first_flutter_application/models/catalog.dart';
import 'package:first_flutter_application/widgets/themes.dart';

import '../utils/routes.dart';
import '../widgets/drawer.dart';
import '../widgets/items_widget.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int age = 21;
  String name = "Manthan";

  final url = "https://api.jsonbin.io/v3/b/6427d132ebd26539d0a221e9";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    // print(productsData);
    CatalogModels.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummyList = List.generate(20, (index) => CatalogModels.items[0]);
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, Null) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            size: 20,
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            count: _cart.items.length),
      ),
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CatalogHeader(),
              if (CatalogModels.items != null && CatalogModels.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                Center(
                  child: CircularProgressIndicator().centered().expand(),
                )
            ])),
      ),
    );
  }
}

// class CatalogHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       "Catalog App".text.xl5.bold.color(MyTheme.darkbluishColor).make(),
//       "Products".text.xl2.make()
//     ]);
//   }
// }

// class CatalogList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: CatalogModels.items.length,
//       itemBuilder: (context, index) {
//         final catalog = CatalogModels.items[index];
//         return CatalogItem(catalog: catalog);
//       },
//     );
//   }
// }

// class CatalogItem extends StatelessWidget {
//   final catalog;

//   const CatalogItem({super.key, required this.catalog})
//       : assert(catalog != null);
//   @override
//   Widget build(BuildContext context) {
//     return VxBox(
//         child: Row(
//       children: [
//         CatalogImage(image: catalog.image),
//         Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
              
//           children: [

            
//             "\ ${catalog.name}".text.xl.bold.make(),
//             "\ ${catalog.desc}".text.textStyle(context.captionStyle).make(),
//             ButtonBar(
//               alignment: MainAxisAlignment.spaceBetween,
//               children: [
//               "\₹${catalog.price}".text.bold.xl.make(),
//               10.heightBox,
//               ElevatedButton(
//                 onPressed: (){}, 
//                 style: ButtonStyle(
//                   foregroundColor: MaterialStatePropertyAll(Colors.white), 
//                   backgroundColor: MaterialStatePropertyAll(Colors.black),
//                   // shape: MaterialStateProperty.all(
//                   //   StadiumBorder()
//                   // )
//                 ),
//                 child: "Buy".text.make())

//             ],).pOnly(right: 10)
//           ],
//         ))
//       ],
//     )).white.rounded.square(100).make().py16();
//   }
// }

// class CatalogImage extends StatelessWidget {
//   final String image;

//   const CatalogImage({super.key, required this.image}) : assert(image != null);
//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(image)
//         .box
//         // .p16
//         .color(MyTheme.creamColor)
//         .make()
//         .p16();
//     // .w40(context)
//   }
// }
