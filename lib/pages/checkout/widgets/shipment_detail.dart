import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../helpers/api_store.dart';
import '../models/store_model.dart';
import '../provider/checkout_pr.dart';
import '../provider/store_pr.dart';
import 'package:provider/provider.dart';
import '../../../resource/style_text.dart';

class ShipmentDetail extends StatefulWidget {
  const ShipmentDetail({Key? key}) : super(key: key);

  @override
  _ShipmentDetailState createState() => _ShipmentDetailState();
}

class _ShipmentDetailState extends State<ShipmentDetail> {
  DateTime dateNow = DateTime.now();
  TextEditingController _receiverField = TextEditingController();
  TextEditingController _addressField = TextEditingController();

  _getStores() async {
    final provider = Provider.of<StoreProvider>(context, listen: false);
    final response = await StoreService.getStores();
    if (response.isSuccessful!) {
      provider.setStoreList(response.data!);
    } else {
      // ignore: avoid_print
      print(response.message!);
    }
    provider.setIsProcessing(false);
  }

  _formProvider() {
    final provider = Provider.of<CheckoutProvider>(context, listen: false);
    _receiverField = TextEditingController(text: provider.getReceiver);
    _addressField = TextEditingController(text: provider.getAddress);
  }

  @override
  void initState() {
    super.initState();
    _getStores();
    _formProvider();
  }

  @override
  void dispose() {
    _receiverField.dispose();
    _addressField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<StoreProvider, CheckoutProvider>(
        builder: (context, store, checkout, child) => store.isProcessing
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thông tin giao hàng",
                      style: ConstantsText.titleStyle,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(2),
                          bottomLeft: Radius.circular(2),
                          bottomRight: Radius.circular(2),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.05),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _receiverField,
                            onChanged: checkout.setReceiver,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              hintText: "Người nhận",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Người nhận không được bỏ trống";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _addressField,
                            onChanged: checkout.setAddressReceiver,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: Colors.black,
                              ),
                              hintText: "Địa chỉ nhận",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Địa chỉ nhận không được bỏ trống";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width * 0.88,
                            child: DropdownButton<StoreModel>(
                              value: store.getStoreModel ?? store.getStoreList[0],
                              onChanged: (StoreModel? value) {
                                store.setStoreModel(value!);
                              },
                              items: store.getStoreList
                                  .map<DropdownMenuItem<StoreModel>>(
                                      (StoreModel value) {
                                return DropdownMenuItem<StoreModel>(
                                  value: value,
                                  child: Text(value.storeName),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Ngày giao: " +
                                DateFormat('dd-MM-yyyy')
                                    .format(dateNow)
                                    .toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
}
