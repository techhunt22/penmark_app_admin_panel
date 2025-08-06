// To parse this JSON data, do
//
//     final getPaperTypeModel = getPaperTypeModelFromJson(jsonString);

import 'dart:convert';

import '../../../../domain/entities/settings/papertype/get_papertype_entity.dart';

GetPaperTypeModel getPaperTypeModelFromJson(String str) => GetPaperTypeModel.fromJson(json.decode(str));

String getPaperTypeModelToJson(GetPaperTypeModel data) => json.encode(data.toJson());

class GetPaperTypeModel {
  final bool success;
  final String message;
  final List<Data> data;

  GetPaperTypeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetPaperTypeModel.fromJson(Map<String, dynamic> json) => GetPaperTypeModel(
    success: json["success"],
    message: json["message"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  GetPaperTypeEntity  toEntity()=> GetPaperTypeEntity(
    success: success,
    message: message,
    data: data.map((x) => x.toEntity()).toList(),

  );



}

class Data {
  final String id;
  final String type;
  final double price;
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


  GetPaperTypeDataEntity  toEntity()=> GetPaperTypeDataEntity(
      id: id,
      type: type,
      price: price,
      createdAt: createdAt

  );



}
