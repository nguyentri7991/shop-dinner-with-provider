import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '../pages/auth/models/auth_model.dart';
import './http_response.dart';
import '../../../resource/url_api.dart';

class AuthService {
  static Future<HTTPResponse<AuthModel>> signIn(
      String phoneNumber, String password) async {
    String url = ConstantsURL.URL_AUTH;
    Map<String, String> headers = {"Content-type": "application/json"};
    Map data = {
      'sodienthoai': phoneNumber,
      'password': password,
    };
    String body = jsonEncode(data);
    try {
      var response = await post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        AuthModel authModel = AuthModel.fromJson(jsonDecode(response.body));
        return HTTPResponse(true, authModel, responseCode: response.statusCode);
      } else {
        return HTTPResponse(
          false,
          null,
          message: "Invalid response received from server! Please try again",
          responseCode: response.statusCode,
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message: "Unable to reach the internet! Please try again in a minute",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message: "Invalid response received from server! Please try again",
      );
    } catch (error) {
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Topping",
      );
    }
  }

  static Future<HTTPResponse<String>> signUp(String nameClient,
      String phoneNumber, String password, String confirmPassword) async {
    String url = ConstantsURL.URL_CLIENT;
    Map<String, String> headers = {"Content-type": "application/json"};
    Map data = {
      'tenKH': nameClient,
      'sodienthoai': phoneNumber,
      'password': password,
      'password_confirmation': confirmPassword
    };
    String body = jsonEncode(data);
    try {
      var response = await post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        String data = response.body;
        return HTTPResponse(true, data, responseCode: response.statusCode);
      } else {
        return HTTPResponse(
          false,
          null,
          message: "Invalid response received from server! Please try again",
          responseCode: response.statusCode,
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message: "Unable to reach the internet! Please try again in a minute",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message: "Invalid response received from server! Please try again",
      );
    } catch (error) {
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Topping",
      );
    }
  }
}
