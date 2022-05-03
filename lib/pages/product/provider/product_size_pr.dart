import 'package:flutter/material.dart';
import '../models/detail_product_size_model.dart';

class SizeProvider extends ChangeNotifier {
  bool _isProcessing = true;

  List<DetailProductSizeModel> _sizeList = [];

  DetailProductSizeModel _value =
      DetailProductSizeModel(id: 0, name: "M", price: 0, quantity: 1);

  bool get isProcessing => _isProcessing;

  List<DetailProductSizeModel> get sizeList => _sizeList;

  setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  setSizeList(List<DetailProductSizeModel> list) {
    _sizeList = list;
    notifyListeners();
  }

  DetailProductSizeModel get getSizeValue => _value;

  void changeSizeValue(DetailProductSizeModel model) {
    _value = model;
    notifyListeners();
  }

  void increaseAmount(DetailProductSizeModel model) {
    model.toggleDone();
    notifyListeners();
  }

  void decreaseAmount(DetailProductSizeModel model) {
    model.decreaseDown();
    notifyListeners();
  }
}
