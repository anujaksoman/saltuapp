import 'dart:convert';

import 'package:saltuapp/data/model/characterModel.dart';
import 'package:saltuapp/data/model/legendModel.dart';
import 'package:saltuapp/services/api-service.dart';
import 'package:saltuapp/services/http_service.dart';

class HomeRepository {

  static final HttpHelper _http = HttpHelper();

  ///Character Details

  Future<dynamic> getCharacterDetails() async {
    var response = await _http.get(Api.characters);
    if (response.runtimeType.toString() == "Response") {
      CharacterModel data = CharacterModel.fromJson(jsonDecode(response.body));
      return data;
    }
    return response;
  }


  ///Legend Details

  Future<dynamic> getLegendDetails() async {
    var response = await _http.get(Api.legends);
    if (response.runtimeType.toString() == "Response") {
      LegendModel data = LegendModel.fromJson(jsonDecode(response.body));
      return data;
    }
    return response;
  }


  ///About Details

  Future<dynamic> getAboutDetails() async {
    var response = await _http.get(Api.about);
    if (response.runtimeType.toString() == "Response") {
      LegendModel data = LegendModel.fromJson(jsonDecode(response.body));
      return data;
    }
    return response;
  }

}