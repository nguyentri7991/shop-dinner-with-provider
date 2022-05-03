import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  bool _isProcessing = true;

  List<ProductModel> _productList = [];

  bool get isProcessing => _isProcessing;

  setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  List<ProductModel> get productList => _productList;

  setProductList(List<ProductModel> list) {
    _productList = list;
    notifyListeners();
  }
}
