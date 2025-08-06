// To parse this JSON data, do
//
//     final updateUserModel = updateUserModelFromJson(jsonString);

import 'dart:convert';

import 'package:coloring_app_admin_panel/src/domain/entities/user/update_user_entity.dart';

UpdateUserModel updateUserModelFromJson(String str) =>
    UpdateUserModel.fromJson(json.decode(str));

String updateUserModelToJson(UpdateUserModel data) =>
    json.encode(data.toJson());

class UpdateUserModel {
  final bool success;
  final String message;
  final Data data;

  UpdateUserModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };

  UpdateUserEntity toEntity() =>
      UpdateUserEntity(
          success: success,
          message: message,
          data: data.toEntity()
      );


}

class Data {
  final String id;
  final String fullname;
  final String email;
  final String password;
  final List<dynamic> fcmTokens;
  final String status;
  final dynamic refreshToken;
  final List<dynamic> userTemplates;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.fullname,
    required this.email,
    required this.password,
    required this.fcmTokens,
    required this.status,
    required this.refreshToken,
    required this.userTemplates,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(
        id: json["_id"],
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
        fcmTokens: List<dynamic>.from(json["fcmTokens"].map((x) => x)),
        status: json["status"],
        refreshToken: json["refreshToken"],
        userTemplates: List<dynamic>.from(json["userTemplates"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "_id": id,
        "fullname": fullname,
        "email": email,
        "password": password,
        "fcmTokens": List<dynamic>.from(fcmTokens.map((x) => x)),
        "status": status,
        "refreshToken": refreshToken,
        "userTemplates": List<dynamic>.from(userTemplates.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };

  UpdateUserDataEntity toEntity() => UpdateUserDataEntity(
          id: id,
          fullname: fullname,
          email: email,
          status: status);


}
