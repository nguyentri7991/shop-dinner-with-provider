class ProductModel {
  final int id;
  final String name;
  final String image;
  final int price;
  final double discount;

  ProductModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.discount});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['tensanpham'],
      image: json['anh'],
      price: json['gia'],
      discount: json['discount'],
    );
  }
}
