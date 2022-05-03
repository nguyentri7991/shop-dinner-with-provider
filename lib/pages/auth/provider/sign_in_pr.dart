import 'package:flutter/material.dart';
import '../../../helpers/api_auth.dart';
import '../models/auth_model.dart';

class SignInProvider extends ChangeNotifier {
  bool _isProcessing = true;
  String _phoneNumber = "";
  String _password = "";
  AuthModel? _authModel;

  bool get isProcessing => _isProcessing;

  String get getPhoneNumber => _phoneNumber;

  String get getPassword => _password;

  AuthModel? get getAuthModel => _authModel;

  setPhoneNumber(String phone) {
    _phoneNumber = phone;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  setAuthModel(AuthModel authModel) {
    _authModel = authModel;
    notifyListeners();
  }

  login() async {
    var response = await AuthService.signIn(_phoneNumber, _password);
    if (response.isSuccessful!) {
      setAuthModel(response.data!);
    }
    _isProcessing = false;
    notifyListeners();
  }
}
