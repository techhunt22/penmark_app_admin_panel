// To parse this JSON data, do
//
//     final getPaperSizeModel = getPaperSizeModelFromJson(jsonString);

import 'dart:convert';

import '../../../../domain/entities/settings/papersize/get_papersize_entity.dart';


GetPaperSizeModel getPaperSizeModelFromJson(String str) => GetPaperSizeModel.fromJson(json.decode(str));

String getPaperSizeModelToJson(GetPaperSizeModel data) => json.encode(data.toJson());

class GetPaperSizeModel {
  final bool success;
  final String message;
  final List<Data> data;

  GetPaperSizeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetPaperSizeModel.fromJson(Map<String, dynamic> json) => GetPaperSizeModel(
    success: json["success"],
    message: json["message"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  GetPaperSizeEntity  toEntity()=> GetPaperSizeEntity(
      success: success,
      message: message,
      data: data.map((x) => x.toEntity()).toList(),

  );


}

class Data {
  final String id;
  final String size;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.size,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    size: json["size"],
    price: json["price"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "size": size,
    "price": price,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };

  GetPaperSizeDataEntity  toEntity()=> GetPaperSizeDataEntity(
      id: id,
      size: size,
      price: price,
      createdAt: createdAt


  );


}
