import './order_detail_model.dart';

class OrderModel {
  final String orderDate;
  final String approvalDate;
  final String deliveryDate;
  final String receivedDate;
  final String purchaseForm;
  final int transportFee;
  final double totalPrice;
  final int orderStatusId;
  final int transportId;
  final int storeId;
  final int clientId;
  final String receivingAddress;
  final String receiver;
  final List<OrderDetailModel> orderDetailModel;

  OrderModel(
      {required this.orderDate,
      required this.approvalDate,
      required this.deliveryDate,
      required this.receivedDate,
      required this.purchaseForm,
      required this.transportFee,
      required this.totalPrice,
      required this.orderStatusId,
      required this.transportId,
      required this.storeId,
      required this.clientId,
      required this.receivingAddress,
      required this.receiver,
      required this.orderDetailModel});

  Map<String, dynamic> toJson() => {
        'ngaydat': orderDate,
        'ngayduyet': approvalDate,
        'ngaygiao': deliveryDate,
        'ngaynhan': receivedDate,
        'hinhthucmua': purchaseForm,
        'phiship': transportFee,
        'tonggia': totalPrice,
        'order_status_id': orderStatusId,
        'vanchuyen_id': transportId,
        'khachhang_id': clientId,
        'cuahang_id': storeId,
        'diachinhan': receivingAddress,
        'nguoinhan': receiver,
        'ct_sp_ches_attributes': orderDetailModel,
      };
}
