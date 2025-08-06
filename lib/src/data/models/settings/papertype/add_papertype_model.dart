// To parse this JSON data, do
//
//     final addPaperTypeModel = addPaperTypeModelFromJson(jsonString);

import 'dart:convert';

import '../../../../domain/entities/settings/papertype/add_papertype_entity.dart';


AddPaperTypeModel addPaperTypeModelFromJson(String str) => AddPaperTypeModel.fromJson(json.decode(str));

String addPaperTypeModelToJson(AddPaperTypeModel data) => json.encode(data.toJson());

class AddPaperTypeModel {
  final bool success;
  final String message;
  final Data data;

  AddPaperTypeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AddPaperTypeModel.fromJson(Map<String, dynamic> json) =>
      AddPaperTypeModel(
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

  AddPaperTypeEntity toEntity() =>
      AddPaperTypeEntity(
        success: success,
        message: message,
          data: data.toEntity()

      );
}


  class Data {
  final String type;
  final double price;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.type,
    required this.price,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    type: json["type"],
    price: json["price"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "price": price,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };

  AddPaperTypeDataEntity toEntity() => AddPaperTypeDataEntity(
      type: type,
      price: price,
      id: id,
      createdAt: createdAt

  );
}
