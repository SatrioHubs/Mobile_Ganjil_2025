class Item {
  final String name;
  final int price;
  final String? photo;
  final int stock;
  final double rating;

  Item({
    required this.name,
    required this.price,
    this.photo,
    this.stock = 0,
    this.rating = 0.0,
  });
}
