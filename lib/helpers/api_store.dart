import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '../pages/checkout/models/store_model.dart';
import './http_response.dart';
import '../../../resource/url_api.dart';

class StoreService {
  static Future<HTTPResponse<List<StoreModel>>> getStores() async {
    String url = ConstantsURL.URL_STORE;
    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<StoreModel> listModel = [];
        try {
          body.forEach((e) {
            StoreModel toppingModel = StoreModel.fromJson(e);
            listModel.add(toppingModel);
          });
        }catch(e) {
          // ignore: avoid_print
          print(e);
        }
        return HTTPResponse(true, listModel,
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
