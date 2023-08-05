// To parse this JSON data, do
//
//     final legendModel = legendModelFromJson(jsonString);

import 'dart:convert';

LegendModel legendModelFromJson(String str) => LegendModel.fromJson(json.decode(str));

String legendModelToJson(LegendModel data) => json.encode(data.toJson());

class LegendModel {
  String? content;

  LegendModel({
     this.content,
  });

  factory LegendModel.fromJson(Map<String, dynamic> json) => LegendModel(
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
  };
}
