// To parse this JSON data, do
//
//     final deleteTemplateModel = deleteTemplateModelFromJson(jsonString);

import 'dart:convert';
import '../../../domain/entities/collection/delete_collection_entity.dart';


DeleteCollectionModel deleteCollectionModelFromJson(String str) => DeleteCollectionModel.fromJson(json.decode(str));

String deleteCollectionModelToJson(DeleteCollectionModel data) => json.encode(data.toJson());


class DeleteCollectionModel {
  final bool success;
  final String message;

  DeleteCollectionModel({
    required this.success,
    required this.message,
  });

  factory DeleteCollectionModel.fromJson(Map<String, dynamic> json) => DeleteCollectionModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };

  DeleteCollectionEntity toEntity()=> DeleteCollectionEntity(
      success: success,
      message: message
  );

}
