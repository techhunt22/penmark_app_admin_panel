// To parse this JSON data, do
//
//     final updatePaperSizeModel = updatePaperSizeModelFromJson(jsonString);

import 'dart:convert';

import '../../../../domain/entities/settings/papersize/update_papersize_entity.dart';


UpdatePaperSizeModel updatePaperSizeModelFromJson(String str) => UpdatePaperSizeModel.fromJson(json.decode(str));

String updatePaperSizeModelToJson(UpdatePaperSizeModel data) => json.encode(data.toJson());

class UpdatePaperSizeModel {
  final bool success;
  final String message;
  final Data data;

  UpdatePaperSizeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UpdatePaperSizeModel.fromJson(Map<String, dynamic> json) => UpdatePaperSizeModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };

  UpdatePaperSizeEntity toEntity()=> UpdatePaperSizeEntity(
      success: success,
      message: message,
      data: data.toEntity()

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

  UpdatePaperSizeDataEntity toEntity()=> UpdatePaperSizeDataEntity(
      id: id,
      size: size,
      price: price,
      createdAt: createdAt
  );

}
