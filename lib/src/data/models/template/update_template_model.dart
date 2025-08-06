// To parse this JSON data, do
//
//     final updateTemplateModel = updateTemplateModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/template/update_template_entity.dart';

UpdateTemplateModel updateTemplateModelFromJson(String str) =>
    UpdateTemplateModel.fromJson(json.decode(str));

String updateTemplateModelToJson(UpdateTemplateModel data) =>
    json.encode(data.toJson());

class UpdateTemplateModel {
  final bool success;
  final String message;
  final Data data;

  UpdateTemplateModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UpdateTemplateModel.fromJson(Map<String, dynamic> json) =>
      UpdateTemplateModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };

  UpdateTemplateEntity toEntity() => UpdateTemplateEntity(
      success: success,
      message: message,
      data: data.toEntity()
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

  UpdateTemplateEntityData toEntity() => UpdateTemplateEntityData(
      id: id,
      name: name,
      collectionname:collectionname,
      svgImage: svgImage,
      status: status,
      createdAt: createdAt,

  );
}
