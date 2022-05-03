
import 'http_response.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

class ApiService {
   Future<HTTPResponse<dynamic>> getListData(String url) async {
    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        return HTTPResponse(true, body,
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

   Future<HTTPResponse<dynamic>> getDataByID(String url,dynamic id) async {
     // ignore: non_constant_identifier_names
     String URBAIN = url+ "/$id";
     try {
       var response = await get(Uri.parse(URBAIN));
       if (response.statusCode == 200) {
         var body = jsonDecode(response.body);
         return HTTPResponse(true, body,
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
}
