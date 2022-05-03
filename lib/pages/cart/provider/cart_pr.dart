import 'package:flutter/material.dart';
import '../../product/models/topping_model.dart';
import '../models/cart_item_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItemModel> _listCartItem = [];

  int get amountItem => _listCartItem.length;

  double _totalPriceCart = 0;

  int _qtyCartItem = 0;

  List<CartItemModel> get cartListItem => _listCartItem;

  double get totalPriceCart => _totalPriceCart;

  int get qtyCartItem => _qtyCartItem;

  void addCart(int id, String productName, String productImage, int productId,
      double price, List<ToppingModel> listTopping, int quantity) {
    final newItemCart = CartItemModel(
        id: id,
        productName: productName,
        productImage: productImage,
        price: price,
        listTopping: listTopping,
        quantity: quantity);
    if (_listCartItem.isNotEmpty) {
      bool isFound = false;
      for (int itemCount = 0; itemCount < amountItem; itemCount++) {
        if (_listCartItem[itemCount].id == newItemCart.id &&
            _listCartItem[itemCount].listTopping == newItemCart.listTopping) {
          isFound = true;
          _listCartItem[itemCount].toggleDone();
          _qtyCartItem++;
          _totalPriceCart += _listCartItem[itemCount].price;
          notifyListeners();
          break;
        }
      }
      if (!isFound) {
        _listCartItem.add(newItemCart);
        _qtyCartItem++;
        _totalPriceCart += newItemCart.price;
        notifyListeners();
      }
    } else {
      _listCartItem.add(newItemCart);
      _qtyCartItem += quantity;
      _totalPriceCart += price * quantity;
      notifyListeners();
    }
  }

  void removeCart(
      int id,
      String productName,
      String productImage,
      int productId,
      double price,
      List<ToppingModel> listTopping,
      int quantity) {
    final newItemCart = CartItemModel(
        id: id,
        productName: productName,
        productImage: productImage,
        price: price,
        listTopping: listTopping,
        quantity: quantity);
    if (_listCartItem.isNotEmpty) {
      for (int itemCount = 0; itemCount < amountItem; itemCount++) {
        if (_listCartItem[itemCount].id == newItemCart.id) {
          decrease(_listCartItem[itemCount]);
          _totalPriceCart -= _listCartItem[itemCount].price;
          notifyListeners();
          break;
        }
      }
    }
  }

  void increase(CartItemModel item) {
    item.toggleDone();
    _qtyCartItem++;
    _totalPriceCart += item.price;
    notifyListeners();
  }

  void decrease(CartItemModel item) {
    _qtyCartItem--;
    if (item.quantity == 1) {
      removeCard(item);
    }
    _totalPriceCart -= item.price;
    item.decreaseDown();
    notifyListeners();
  }

  void removeCard(CartItemModel item) {
    _listCartItem.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _listCartItem.clear();
    _qtyCartItem = 0;
    _totalPriceCart = 0;
    notifyListeners();
  }
}
