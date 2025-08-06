// To parse this JSON data, do
//
//     final deletePaperSizeModel = deletePaperSizeModelFromJson(jsonString);

import 'dart:convert';

import '../../../../domain/entities/settings/papersize/delete_papersize_entity.dart';


DeletePaperSizeModel deletePaperSizeModelFromJson(String str) => DeletePaperSizeModel.fromJson(json.decode(str));

String deletePaperSizeModelToJson(DeletePaperSizeModel data) => json.encode(data.toJson());

class DeletePaperSizeModel {
  final bool success;
  final String message;

  DeletePaperSizeModel({
    required this.success,
    required this.message,
  });

  factory DeletePaperSizeModel.fromJson(Map<String, dynamic> json) => DeletePaperSizeModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };

  DeletePaperSizeEntity toEntity()=> DeletePaperSizeEntity(
      success: success,
      message: message

  );


}
