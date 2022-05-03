import 'package:flutter/material.dart';
import '../models/store_model.dart';

class StoreProvider extends ChangeNotifier {
  bool _isProcessing = true;

  List<StoreModel> _listStore = [];

  StoreModel? _selected;

  bool get isProcessing => _isProcessing;

  setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  List<StoreModel> get getStoreList => _listStore;

  setStoreList(List<StoreModel> list) {
    _listStore = list;
    notifyListeners();
  }

  StoreModel? get getStoreModel => _selected;

  setStoreModel(StoreModel model) {
    _selected = model;
    notifyListeners();
  }
}
