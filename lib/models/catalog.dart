class CatalogModels {
  static final items = [
    Item(
        id: 1001,
        name: 'iPhone 14 Pro',
        desc: 'Apple',
        price: 129900,
        color: '#33505a',
        image: 'assets/images/iphone_14_Pro_img.jpeg'),
    Item(
        id: 1002,
        name: 'iPhone 14',
        desc: 'Apple',
        price: 79900,
        color: '#33505a',
        image: 'assets/images/iphone_14_img.jpeg'),
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
