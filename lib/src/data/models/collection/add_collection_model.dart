// To parse this JSON data, do
//
//     final addCollectionModel = addCollectionModelFromJson(jsonString);

import 'dart:convert';

import 'package:coloring_app_admin_panel/src/domain/entities/collection/add_collection_entity.dart';

AddCollectionModel addCollectionModelFromJson(String str) => AddCollectionModel.fromJson(json.decode(str));

String addCollectionModelToJson(AddCollectionModel data) => json.encode(data.toJson());

class AddCollectionModel {
  final bool success;
  final String message;
  final Data data;

  AddCollectionModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AddCollectionModel.fromJson(Map<String, dynamic> json) => AddCollectionModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };

  AddCollectionEntity toEntity()=> AddCollectionEntity(
      success: success,
      message: message,
      data: data.toEntity(),
  );


}

class Data {
  final String name;
  final int templatesCount;
  final String status;
  final String admin;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Data({
    required this.name,
    required this.templatesCount,
    required this.status,
    required this.admin,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    templatesCount: json["templatesCount"],
    status: json["status"],
    admin: json["admin"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "templatesCount": templatesCount,
    "status": status,
    "admin": admin,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };

  AddCollectionDataEntity toEntity()=> AddCollectionDataEntity(
      name: name,
      templatesCount: templatesCount,
      status: status,
      admin: admin,
      id: id,
      createdAt: createdAt


  );




}
