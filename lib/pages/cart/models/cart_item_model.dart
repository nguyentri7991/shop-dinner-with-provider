import '../../product/models/topping_model.dart';

class CartItemModel {
  final int id;
  final String productName;
  final String productImage;
  final double price;
  List<ToppingModel> listTopping;
  int quantity;

  CartItemModel(
      {required this.id,
      required this.productName,
      required this.productImage,
      required this.price,
      required this.listTopping,
      this.quantity = 1});

  void toggleDone() {
    quantity++;
  }

  void decreaseDown() {
    quantity == 0 ? 0 : quantity--;
  }
}
