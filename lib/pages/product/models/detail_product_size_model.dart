class DetailProductSizeModel {
  final int id;
  final String name;
  late final int price;
  int quantity;
  DetailProductSizeModel(
      {required this.id, required this.name, required this.price, this.quantity = 1});

  factory DetailProductSizeModel.fromJson(Map<String, dynamic> json) {
    return DetailProductSizeModel(
      id: json['id'],
      name: json['tensize'],
      price: json['gia'],
    );
  }
  void toggleDone() {
    quantity++;
  }

  void decreaseDown() {
    quantity == 0 ? 0 : quantity--;
  }
}
