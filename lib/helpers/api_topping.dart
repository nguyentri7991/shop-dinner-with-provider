import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import './http_response.dart';
import '../../../resource/url_api.dart';
import '../pages/product/models/topping_model.dart';

class ToppingService {
  static Future<HTTPResponse<List<ToppingModel>>> getToppings() async {
    String url = ConstantsURL.URL_TOPPING;
    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<ToppingModel> toppingList = [];
        try {
          body.forEach((e) {
            ToppingModel toppingModel = ToppingModel.fromJson(e);
            toppingList.add(toppingModel);
          });
        }catch(e) {
          // ignore: avoid_print
          print(e);
        }
        return HTTPResponse(true, toppingList,
            responseCode: response.statusCode);
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
