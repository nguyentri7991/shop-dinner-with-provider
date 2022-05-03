import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '../pages/home/models/promotion_model.dart';
import './http_response.dart';
import '../../../resource/url_api.dart';

class PromotionService {
  static Future<HTTPResponse<List<PromotionModel>>> getPromotions() async {
    String url = ConstantsURL.URL_PROMOTION;
    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<PromotionModel> listModel = [];
        try {
          body.forEach((e) {
            PromotionModel model = PromotionModel.fromJson(e);
            listModel.add(model);
          });
        } catch (e) {
          // ignore: avoid_print
          print(e);
        }
        return HTTPResponse(true, listModel, responseCode: response.statusCode);
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
