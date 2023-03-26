import 'package:first_flutter_application/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../widgets/drawer.dart';
import '../widgets/items_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int age = 21;
  String name = "Manthan";

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
    final decodedData = json.decode(catalogJson);
    var productsData = decodedData["products"];
    // print(productsData);
    CatalogModels.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModels.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModels.items != null && CatalogModels.items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModels.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemWidget(item: CatalogModels.items[index]);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
