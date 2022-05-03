class ToppingModel {
  int id;
  String name;
  int price;
  ToppingModel({required this.id, required this.name, required this.price});

  factory ToppingModel.fromJson(Map<String, dynamic> json) {
    return ToppingModel(
      id: json['id'],
      name: json['tenthanhphan'],
      price: json['gia'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'tenthanhphan': name,
        'gia': price,
      };
}
