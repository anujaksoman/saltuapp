import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saltuapp/data/model/ErrorOnlyModel.dart';
import 'package:saltuapp/data/model/ValidationModel.dart';

class HttpHelper {

  Future<dynamic> get(String url, {bool auth = false}) async {
    printInfo(info: url);
    print("url get= $url");

    var responseJson;
    try {
      final response = await http.get(Uri.parse(url),);
      responseJson = _returnResponse(response);
    } on SocketException {
      print("No Internet connection");
    } on Exception {
      print("Unhandled Exception");
    }
    return responseJson;
  }


  dynamic _returnResponse(http.Response response) async {
    printInfo(info: response.body.toString());

    var responseBody = jsonDecode(response.body);

    print("test status code ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
      case 400:
      case 401:
        var validationResponse =ValidationModel.fromJson(jsonDecode(response.body.toString()));
        return validationResponse;
      case 404:
        var message = responseBody['error'] != null &&
            responseBody['error']['message'] != null
            ? responseBody['error']['message']
            : '404 error from server';
        print(message);
        break;
    //var responseJson = response.body;
    //return responseJson;
      case 403:
        var message = responseBody['error'] != null
            ? responseBody['error']
            : response.statusCode.toString() + ' error from server';

        print(message);
        break;
      case 422:
        var responseJson = response.body;
        ValidationModel modelData =
        ValidationModel.fromJson(jsonDecode(responseJson));
        return modelData;
      case 500:
      default:
        var responseJson = response.body;
        ErrorOnlyModel modelData =
        ErrorOnlyModel.fromMap(jsonDecode(responseJson));
        return modelData;

    /*throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
            response.statusCode);*/
    }
  }


}
