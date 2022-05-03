import 'package:flutter/material.dart';

class CheckoutProvider extends ChangeNotifier {
  String _receiver = "";
  String _address = "";

  String get getReceiver => _receiver;

  setReceiver(String receiver) {
    _receiver = receiver;
    notifyListeners();
  }

  String get getAddress => _address;

  setAddressReceiver(String address) {
    _address = address;
    notifyListeners();
  }

  setClearTextField() {
    _receiver = "";
    _address = "";
  }
}
