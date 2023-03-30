import 'package:first_flutter_application/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:first_flutter_application/models/catalog.dart';
import 'package:first_flutter_application/models/catalog.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [cartList().p32().expand(), Divider(), cartTotal()],
      ),
    );
  }
}

class cartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\ ₹10".text.xl5.make(),
          30.heightBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            "Application is under Maintenance!!".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  child: "Buy".text.white.make())
              .w16(context)
        ],
      ),
    );
  }
}

class cartList extends StatefulWidget {
  @override
  State<cartList> createState() => _cartListState();
}

class _cartListState extends State<cartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () {}, icon: Icon(Icons.remove_circle_rounded)),
              title: "Item 1".text.make(),
            ));
  }
}
