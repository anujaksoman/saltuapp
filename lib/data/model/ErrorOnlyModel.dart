import 'dart:convert';

ErrorOnlyModel errorOnlyModelFromMap(String str) =>
    ErrorOnlyModel.fromMap(json.decode(str));

String errorOnlyModelToMap(ErrorOnlyModel data) => json.encode(data.toMap());

class ErrorOnlyModel {
  ErrorOnlyModel({
    this.message,
    this.errors,
    this.parameters,
    this.trace,
  });

  final String? message;
  final List<Error>? errors;
  final String? trace;
  final Parameters? parameters;

  factory ErrorOnlyModel.fromMap(Map<String, dynamic> json) => ErrorOnlyModel(
        message: json["message"] == null ? null : json["message"],
        errors: json["errors"] == null
            ? null
            : List<Error>.from(json["errors"].map((x) => Error.fromMap(x))),
        trace: json["trace"] == null ? null : json["trace"],
        parameters: json["parameters"] == null
            ? null
            : Parameters.fromMap(json["parameters"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message == null ? null : message,
        "errors": errors == null
            ? null
            : List<dynamic>.from(errors!.map((x) => x.toMap())),
        "trace": trace == null ? null : trace,
        "parameters": parameters == null ? null : parameters!.toMap(),
      };
}

class Error {
  Error({
    this.message,
    this.parameters,
  });

  final String? message;
  final Parameters? parameters;

  factory Error.fromMap(Map<String, dynamic> json) => Error(
        message: json["message"] == null ? null : json["message"],
        parameters: json["parameters"] == null
            ? null
            : Parameters.fromMap(json["parameters"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message == null ? null : message,
        "parameters": parameters == null ? null : parameters!.toMap(),
      };
}

class Parameters {
  Parameters({this.fieldName, this.resource});

  final String? fieldName;
  final String? resource;

  factory Parameters.fromMap(Map<String, dynamic> json) => Parameters(
      fieldName: json["fieldName"] == null ? null : json["fieldName"],
      resource: json['resources'] == null ? null : json['resources']);

  Map<String, dynamic> toMap() => {
        "fieldName": fieldName == null ? null : fieldName,
        "resources": resource == null ? null : resource
      };
}
