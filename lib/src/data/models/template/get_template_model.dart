

import 'dart:convert';

import 'package:coloring_app_admin_panel/src/domain/entities/template/get_templates_entity.dart';

GetTemplatesModel getTemplatesModelFromJson(String str) => GetTemplatesModel.fromJson(json.decode(str));

String getTemplatesModelToJson(GetTemplatesModel data) => json.encode(data.toJson());

class GetTemplatesModel {
  final bool success;
  final String message;
  final List<Data> data;
  final Pagination pagination;

  GetTemplatesModel({
    required this.success,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory GetTemplatesModel.fromJson(Map<String, dynamic> json) => GetTemplatesModel(
    success: json["success"],
    message: json["message"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };

  GetTemplatesEntity toEntity() => GetTemplatesEntity(
      data: data.map((x) => x.toEntity()).toList(),
      pagination:  pagination.toEntity()
  );


}

class Data {
  final String id;
  final String name;
  final String collectionname;
  final String svgImage;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.collectionname,
   required this.svgImage,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    name: json["name"],
    collectionname: json["collectionname"],
    svgImage: json["svgImage"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "collectionname": collectionname,
   "svgImage": svgImage,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };

  GetTemplatesDataEntity toEntity() => GetTemplatesDataEntity(
    id: id,
    name: name,
    collectionname: collectionname,
    svgImage: svgImage,
    status: status,
    createdAt: createdAt,


  );


}

class Pagination {
  final int totalItems;
  final int currentPage;
  final int totalPages;
  final int pageSize;

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

  GetTemplatesPaginationEntity toEntity() => GetTemplatesPaginationEntity(
    totalItems: totalItems,
    currentPage: currentPage,
    totalPages: totalPages,
    pageSize: pageSize,


  );

}
