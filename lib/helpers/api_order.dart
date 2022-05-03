import 'dart:convert';
import 'package:http/http.dart';
import '../pages/cart/models/cart_item_model.dart';
import '../pages/checkout/models/detail_select_topping_model.dart';
import '../pages/checkout/models/order_detail_model.dart';
import '../pages/checkout/models/order_model.dart';
import '../../../resource/url_api.dart';

class OrderService {
  static orderPost(
    double totalPrice,
    int userId,
    int storeId,
    String receiverAddress,
    String receiver,
    List<CartItemModel> listProduct,
  ) async {
    String url = ConstantsURL.URL_ORDER;
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    DateTime dateNow = DateTime.now();
    List<OrderDetailModel> orderProductList = [];

    for (var element in listProduct) {
      OrderDetailModel orderDetailModel = OrderDetailModel(
        productId: element.id,
        quantity: element.quantity,
        price: element.price,
        selectToppingModel: element.listTopping
            .map((e) => DetailSelectToppingModel(
                  toppingId: e.id,
                ))
            .toList(),
      );
      orderProductList.add(orderDetailModel);
    }

    OrderModel orderModel = OrderModel(
      orderDate: DateTime(dateNow.year, dateNow.month, dateNow.day).toString(),
      approvalDate:
          DateTime(dateNow.year, dateNow.month, dateNow.day).toString(),
      deliveryDate:
          DateTime(dateNow.year, dateNow.month, dateNow.day).toString(),
      receivedDate:
          DateTime(dateNow.year, dateNow.month, dateNow.day).toString(),
      purchaseForm: "Tại quầy",
      transportFee: 0,
      totalPrice: totalPrice,
      orderStatusId: 1,
      transportId: 1,
      storeId: storeId,
      clientId: userId,
      receivingAddress: receiverAddress,
      receiver: receiver,
      orderDetailModel: orderProductList,
    );

    String body = jsonEncode(orderModel.toJson());
    var response = await post(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print("Success");
    } else {
      // ignore: avoid_print
      print("error");
    }
  }
}
