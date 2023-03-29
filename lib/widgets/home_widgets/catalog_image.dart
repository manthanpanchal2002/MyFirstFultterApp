
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/themes.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image}) : assert(image != null);
  @override
  Widget build(BuildContext context) {
    return Image.asset(image)
        .box
        // .p16
        .color(MyTheme.creamColor)
        .make()
        .p16();
    // .w40(context)
  }
}
