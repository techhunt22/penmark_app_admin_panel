
import 'dart:convert';

import '../../../domain/entities/template/add_template_entity.dart';

AddTemplatesModel addTemplatesModelFromJson(String str) => AddTemplatesModel.fromJson(json.decode(str));

String addTemplatesModelToJson(AddTemplatesModel data) => json.encode(data.toJson());

class AddTemplatesModel {
  final bool success;
  final String message;
  final Data data;

  AddTemplatesModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AddTemplatesModel.fromJson(Map<String, dynamic> json) => AddTemplatesModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
  AddTemplatesEntity toEntity() => AddTemplatesEntity(
    success: success,
    message: message,
    data: data.toEntity(),
  );

}

class Data {
  final String name;
  final String collectionname;
  final String svgImage;
  final String status;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.name,
    required this.collectionname,
    required this.svgImage,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    collectionname: json["collectionname"],
    svgImage: json["svgImage"],
    status: json["status"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "collectionname": collectionname,
    "svgImage": svgImage,
    "status": status,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };

  AddTemplatesEntityData toEntity() => AddTemplatesEntityData(
    name: name,
    collectionname: collectionname,
    svgImage: svgImage,
    status: status,
    id: id,
  );
}
