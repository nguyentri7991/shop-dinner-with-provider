class DetailProductModel {
  final int id;
  final String name;
  final String image;
  final double discount;
  DetailProductModel(
      {required this.id, required this.name, required this.image,required this.discount});

  factory DetailProductModel.fromJson(Map<String, dynamic> json) {
    return DetailProductModel(
      id: json['id'],
      name: json['tensanpham'],
      image: json['anh'],
      discount: json['discount']
    );
  }
}
