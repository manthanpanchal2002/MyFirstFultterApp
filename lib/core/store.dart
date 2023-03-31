import 'package:first_flutter_application/models/cart.dart';
import 'package:first_flutter_application/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late CatalogModels catalog;
  late CartModel cart;

  MyStore(){
    catalog = CatalogModels();
    cart = CartModel();
    cart.catalog = catalog;
  }
}