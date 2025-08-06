// To parse this JSON data, do
//
//     final updatePaperTypeModel = updatePaperTypeModelFromJson(jsonString);

import 'dart:convert';
import '../../../../domain/entities/settings/papertype/update_papertype_entity.dart';


UpdatePaperTypeModel updatePaperTypeModelFromJson(String str) => UpdatePaperTypeModel.fromJson(json.decode(str));

String updatePaperTypeModelToJson(UpdatePaperTypeModel data) => json.encode(data.toJson());

class UpdatePaperTypeModel {
  final bool success;
  final String message;
  final Data data;

  UpdatePaperTypeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UpdatePaperTypeModel.fromJson(Map<String, dynamic> json) => UpdatePaperTypeModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };

  UpdatePaperTypeEntity toEntity() =>
      UpdatePaperTypeEntity(
          success: success,
          message: message,
          data: data.toEntity()

      );


}

class Data {
  final String id;
  final String type;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.type,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    type: json["type"],
    price: json["price"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "type": type,
    "price": price,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };

  UpdatePaperTypeDataEntity toEntity() => UpdatePaperTypeDataEntity(
      type: type,
      price: price,
      id: id,
      createdAt: createdAt

  );


}
