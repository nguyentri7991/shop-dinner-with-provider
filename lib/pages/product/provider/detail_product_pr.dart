import 'package:flutter/material.dart';
import '../models/detail_product_model.dart';

class DetailProductProvider extends ChangeNotifier {
  bool _isProcessing = true;

  DetailProductModel _productModel =
      DetailProductModel(id: 0, name: "", image: "", discount: 0);

  bool get isProcessing => _isProcessing;

  setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  DetailProductModel get getProductModel => _productModel;

  setDetailProduct(DetailProductModel productModel) {
    _productModel = productModel;
    notifyListeners();
  }
}
