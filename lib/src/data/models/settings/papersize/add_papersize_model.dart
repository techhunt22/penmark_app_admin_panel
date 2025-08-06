// To parse this JSON data, do
//
//     final addPaperSizeModel = addPaperSizeModelFromJson(jsonString);

import 'dart:convert';

import '../../../../domain/entities/settings/papersize/add_papersize_entity.dart';


AddPaperSizeModel addPaperSizeModelFromJson(String str) => AddPaperSizeModel.fromJson(json.decode(str));

String addPaperSizeModelToJson(AddPaperSizeModel data) => json.encode(data.toJson());

class AddPaperSizeModel {
  final bool success;
  final String message;
  final Data data;

  AddPaperSizeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AddPaperSizeModel.fromJson(Map<String, dynamic> json) => AddPaperSizeModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };

  AddPaperSizeEntity toEntity()=> AddPaperSizeEntity(
      success: success,
      message: message,
      data: data.toEntity()

  );


}

class Data {
  final String size;
  final double price;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.size,
    required this.price,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    size: json["size"],
    price: json["price"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "size": size,
    "price": price,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
  AddPaperSizeDataEntity toEntity()=> AddPaperSizeDataEntity(
      size: size,
      price: price,
      id: id,
      createdAt:createdAt
  );



}
