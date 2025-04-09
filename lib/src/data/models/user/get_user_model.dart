// To parse this JSON data, do
//
//     final getUsersModel = getUsersModelFromJson(jsonString);

import 'dart:convert';

import 'package:coloring_app_admin_panel/src/domain/entities/user/get_user_entity.dart';

GetUsersModel getUsersModelFromJson(String str) => GetUsersModel.fromJson(json.decode(str));

String getUsersModelToJson(GetUsersModel data) => json.encode(data.toJson());

class GetUsersModel {
  bool success;
  List<Data> data;
  Pagination pagination;

  GetUsersModel({
    required this.success,
    required this.data,
    required this.pagination,
  });

  factory GetUsersModel.fromJson(Map<String, dynamic> json) => GetUsersModel(
    success: json["success"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };

  GetUsersEntity toEntity() => GetUsersEntity(
      data: data.map((x) => x.toEntity()).toList(),
      pagination:  pagination.toEntity()
  );


}

class Data {
  String id;
  String fullname;
  String email;
  String password;
  List<dynamic> fcmTokens;
  String status;
  String refreshToken;
  List<dynamic> userTemplates;
  DateTime createdAt;
  DateTime updatedAt;
  String phone;

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
    required this.phone,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
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
    "phone": phone,
  };

  GetUsersDataEntity toEntity() => GetUsersDataEntity(
    id: id,
    fullname: fullname,
    email: email,
    phone: phone,
    status: status,
    createdAt: createdAt,


  );


}

class Pagination {
  int totalItems;
  int currentPage;
  int totalPages;
  int pageSize;

  Pagination({
    required this.totalItems,
    required this.currentPage,
    required this.totalPages,
    required this.pageSize,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalItems: json["totalItems"],
    currentPage: json["currentPage"],
    totalPages: json["totalPages"],
    pageSize: json["pageSize"],
  );

  Map<String, dynamic> toJson() => {
    "totalItems": totalItems,
    "currentPage": currentPage,
    "totalPages": totalPages,
    "pageSize": pageSize,
  };

  GetUserPaginationEntity toEntity() => GetUserPaginationEntity(
      totalItems: totalItems,
      currentPage: currentPage,
      totalPages: totalPages,
      pageSize: pageSize



  );


}
