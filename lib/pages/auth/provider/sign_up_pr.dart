import 'package:flutter/material.dart';
import '../../../helpers/api_auth.dart';

class SignUpProvider extends ChangeNotifier {
  bool _isProcessing = true;
  String _nameClient = "";
  String _phoneNumber = "";
  String _password = "";
  String _confirmPassword = "";

  bool get isProcessing => _isProcessing;

  String get getNameClient => _nameClient;

  String get getPhoneNumber => _phoneNumber;

  String get getPassword => _password;

  String get getConfirmPassword => _confirmPassword;

  setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  setNameClient(String nameClient) {
    _nameClient = nameClient;
    notifyListeners();
  }

  setPhoneNumber(String phone) {
    _phoneNumber = phone;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  register() async {
    var response = await AuthService.signUp(
        _nameClient, _phoneNumber, _password, _confirmPassword);
    if (response.isSuccessful!) {
      // ignore: avoid_print
      print(response.data!);
    }
    _isProcessing = false;
    notifyListeners();
  }
}
