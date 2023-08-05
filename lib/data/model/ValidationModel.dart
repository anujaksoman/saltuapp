// To parse this JSON data, do
//
//     final validationModel = validationModelFromJson(jsonString);

import 'dart:convert';

ValidationModel validationModelFromJson(String str) => ValidationModel.fromJson(json.decode(str));

String validationModelToJson(ValidationModel data) => json.encode(data.toJson());

class ValidationModel {
  ValidationModel({
    this.code,
    this.message,
    this.success,
  });

  int? code;
  String? message;
  bool? success;

  factory ValidationModel.fromJson(Map<String, dynamic> json) => ValidationModel(
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "message": message == null ? null : message,
    "success": success == null ? null : success,
  };
}
