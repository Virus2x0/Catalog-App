class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "vivek",
        description: "Iphone 12 pro",
        price: 499,
        color: "#33505a",
        image:
            "https://www.gizmochina.com/wp-content/uploads/2020/05/iphone-12-pro-max-family-hero-all.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.image});
}
