import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import './http_response.dart';
import '../../../resource/url_api.dart';
import '../pages/product/models/detail_product_size_model.dart';

class SizeService {
  static Future<HTTPResponse<List<DetailProductSizeModel>>> getSizes(id) async {
    // ignore: unnecessary_brace_in_string_interps
    String url = ConstantsURL.URL_DETAIL_PRODUCT + '/$id';
    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<DetailProductSizeModel> sizeList = [];
        body.forEach((e) {
          DetailProductSizeModel sizeModel = DetailProductSizeModel.fromJson(e);
          sizeList.add(sizeModel);
        });
        return HTTPResponse(true, sizeList, responseCode: response.statusCode);
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
        message: "Something went wrong! Detail Product",
      );
    }
  }
}
