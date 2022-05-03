import 'package:flutter/material.dart';
import '../models/promotion_model.dart';

class PromotionProvider extends ChangeNotifier {
  bool _isProcessing = true;

  List<PromotionModel> _promotionList = [];

  bool get isProcessing => _isProcessing;

  setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  int get getAmountPromotion => _promotionList.length;

  List<PromotionModel> get getPromotionList => _promotionList;

  setPromotionList(List<PromotionModel> list) {
    _promotionList = list;
    notifyListeners();
  }
}
