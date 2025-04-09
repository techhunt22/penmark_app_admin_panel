

import 'dart:convert';

import 'package:coloring_app_admin_panel/src/domain/entities/collection/get_collection_entities.dart';

GetCollectionsModel getCollectionsModelFromJson(String str) => GetCollectionsModel.fromJson(json.decode(str));

String getCollectionsModelToJson(GetCollectionsModel data) => json.encode(data.toJson());

class GetCollectionsModel {
  final bool success;
  final String message;
  final List<Data> data;
  final Pagination pagination;

  GetCollectionsModel({
    required this.success,
    required this.message,
    required this.data,
    required this.pagination,

  });

  factory GetCollectionsModel.fromJson(Map<String, dynamic> json) => GetCollectionsModel(
    success: json["success"],
    message: json["message"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),


  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<Data>.from(data.map((x) => x.toJson())),
    "pagination": pagination.toJson(),

  };


  GetCollectionsEntity toEntity() => GetCollectionsEntity(
    data: data.map((x) => x.toEntity()).toList(),
    pagination:  pagination.toEntity()
  );

}

class Data{
  final String id;
  final String name;
  final int templatesCount;
 // final String coverImage;
  final String status;
  final String admin;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.templatesCount,
   // required this.coverImage,
    required this.status,
    required this.admin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    name: json["name"],
    templatesCount: json["templatesCount"]?.toInt() ?? 0,
   // coverImage: json["coverImage"],
    status: json["status"],
    admin: json["admin"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "templatesCount": templatesCount,
   // "coverImage": coverImage,
    "status": status,
    "admin": admin,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };

  GetCollectionDataEntity toEntity() => GetCollectionDataEntity(
      id: id,
      name: name,
      templatesCount: templatesCount,
     // coverImage: coverImage,
      status: status,
      admin: admin,
      createdAt: createdAt

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

  PaginationEntity toEntity() => PaginationEntity(
      totalItems: totalItems,
      currentPage: currentPage,
      totalPages: totalPages,
      pageSize: pageSize,


  );

}
