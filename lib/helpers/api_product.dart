import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import './http_response.dart';
import '../resource/url_api.dart';
import '../pages/product/models/detail_product_model.dart';
import '../pages/products/models/product_model.dart';

class ProductService {
  static Future<HTTPResponse<List<ProductModel>>> getProducts() async {
    String url = ConstantsURL.URL_PRODUCT;
    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<ProductModel> productList = [];
          try {
            body.forEach((e) {
              ProductModel productModel = ProductModel.fromJson(e);
              productList.add(productModel);
            });
          }catch (e) {
            // ignore: avoid_print
            print(e);
          }
        return HTTPResponse(true, productList,
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
        message: "Something went wrong! Please try again",
      );
    }
  }

  static Future<HTTPResponse<DetailProductModel>> getProduct(id) async {
    String url = ConstantsURL.URL_PRODUCT + '/$id';
    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        DetailProductModel detailProductModel =
        DetailProductModel.fromJson(jsonDecode(response.body));
        return HTTPResponse(true, detailProductModel,
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
        message: "Something went wrong! Product",
      );
    }
  }
}
