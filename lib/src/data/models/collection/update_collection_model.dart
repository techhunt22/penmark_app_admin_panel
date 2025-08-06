// To parse this JSON data, do
//
//     final updateCollectionModel = updateCollectionModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/collection/update_collection_entity.dart';

UpdateCollectionModel updateCollectionModelFromJson(String str) => UpdateCollectionModel.fromJson(json.decode(str));

String updateCollectionModelToJson(UpdateCollectionModel data) => json.encode(data.toJson());

class UpdateCollectionModel {
  final bool success;
  final String message;
  final Data data;

  UpdateCollectionModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UpdateCollectionModel.fromJson(Map<String, dynamic> json) => UpdateCollectionModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };

  UpdateCollectionEntity toEntity ()=> UpdateCollectionEntity(
      success: success,
      message: message,
      data: data.toEntity(),

  ) ;


}

class Data {
  final String id;
  final String name;
  final int templatesCount;
  final String status;
  final String admin;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.templatesCount,
    required this.status,
    required this.admin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    name: json["name"],
    templatesCount: json["templatesCount"],
    status: json["status"],
    admin: json["admin"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "templatesCount": templatesCount,
    "status": status,
    "admin": admin,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };

  UpdateCollectionDataEntity toEntity ()=> UpdateCollectionDataEntity(
      id: id,
      name: name,
      templatesCount: templatesCount,
      status: status,
      createdAt: createdAt
  ) ;

}
