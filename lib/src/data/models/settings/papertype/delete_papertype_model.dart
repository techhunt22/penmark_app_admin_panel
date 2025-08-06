// To parse this JSON data, do
//
//     final deletePaperTypeModel = deletePaperTypeModelFromJson(jsonString);

import 'dart:convert';

import '../../../../domain/entities/settings/papertype/delete_papertype_entity.dart';


DeletePaperTypeModel deletePaperTypeModelFromJson(String str) => DeletePaperTypeModel.fromJson(json.decode(str));

String deletePaperTypeModelToJson(DeletePaperTypeModel data) => json.encode(data.toJson());

class DeletePaperTypeModel {
  final bool success;
  final String message;
  final Data data;

  DeletePaperTypeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DeletePaperTypeModel.fromJson(Map<String, dynamic> json) => DeletePaperTypeModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };

  DeletePaperTypeEntity toEntity() =>
      DeletePaperTypeEntity(
          success: success,
          message: message,
          data: data.toEntity()

      );

}

class Data {
  final String id;
  final String type;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Data({
    required this.id,
    required this.type,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    type: json["type"],
    price: json["price"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "type": type,
    "price": price,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };

  DeletePaperTypeDataEntity toEntity() => DeletePaperTypeDataEntity(
      id: id,
      type: type,
      price: price,
      createdAt: createdAt



  );


}
