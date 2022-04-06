class categoriesItem {
  final int id;
  final String name;
  final int price;
  final String image;
  final String detail;


  categoriesItem({

    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.detail,
  });

  @override
  String toString() {
    return "$name";
  }
}