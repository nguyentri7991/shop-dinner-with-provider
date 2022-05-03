import './detail_select_topping_model.dart';

class OrderDetailModel {
  final int productId;
  final int quantity;
  final double price;
  final List<DetailSelectToppingModel> selectToppingModel;

  OrderDetailModel({
    required this.productId,
    required this.quantity,
    required this.price,
    required this.selectToppingModel,
  });

  Map<String, dynamic> toJson() => {
        'ctspham_id': productId,
        'soluong': quantity,
        'giact': price,
        "ctchonthems_attributes": selectToppingModel,
      };
}
