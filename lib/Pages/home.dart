import 'package:first_flutter_application/models/catalog.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/items_widget.dart';

class HomePage extends StatelessWidget {
  int age = 21;
  String name = "Manthan";
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(2, (index) => CatalogModels.items[index]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModels.items.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemWidget(item: dummyList[index]);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
