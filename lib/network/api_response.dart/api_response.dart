// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  bool? isSuccessful;
  String? message;
  covariant dynamic data;
  String? responseCode;

  ApiResponse({
    this.isSuccessful,
    this.message,
    this.data,
    this.responseCode,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        isSuccessful: json["isSuccessful"],
        message: json["message"],
        data: json["data"],
        responseCode: json["responseCode"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccessful": isSuccessful,
        "message": message,
        "data": data?.toJson(),
        "responseCode": responseCode,
      };
}
