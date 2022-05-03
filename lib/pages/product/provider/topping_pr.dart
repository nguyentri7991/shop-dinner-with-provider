import 'package:flutter/material.dart';
import '../models/topping_model.dart';

class ToppingProvider extends ChangeNotifier {
  bool _isProcessing = true;

  List<ToppingModel> _toppingList = [];

  List<ToppingModel> _selectToppingList = [];

  int _totalPriceTopping = 0;

  ToppingModel getToppingIndex(index) => _toppingList[index];

  List<ToppingModel> get toppingList => _toppingList;

  List<ToppingModel> get selectToppingList => _selectToppingList;

  int get totalPriceTopping => _totalPriceTopping;

  bool get isProcessing => _isProcessing;

  setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  setToppingList(List<ToppingModel> list) {
    _toppingList = list;
    notifyListeners();
  }

  clearTopping() {
    _selectToppingList = [];
    _totalPriceTopping = 0;
    notifyListeners();
  }

  addTopping(ToppingModel toppingModel) {
    _selectToppingList.add(toppingModel);
    _totalPriceTopping += toppingModel.price;
    notifyListeners();
  }

  removeTopping(ToppingModel toppingModel) {
    _selectToppingList.remove(toppingModel);
    _totalPriceTopping -= toppingModel.price;
    notifyListeners();
  }
}
