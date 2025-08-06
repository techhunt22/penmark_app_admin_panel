// To parse this JSON data, do
//
//     final deleteTemplateModel = deleteTemplateModelFromJson(jsonString);

import 'dart:convert';

import 'package:coloring_app_admin_panel/src/domain/entities/template/delete_template_entity.dart';

DeleteTemplateModel deleteTemplateModelFromJson(String str) => DeleteTemplateModel.fromJson(json.decode(str));

String deleteTemplateModelToJson(DeleteTemplateModel data) => json.encode(data.toJson());

class DeleteTemplateModel {
  final bool success;
  final String message;

  DeleteTemplateModel({
    required this.success,
    required this.message,
  });

  factory DeleteTemplateModel.fromJson(Map<String, dynamic> json) => DeleteTemplateModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };

  DeleteTemplateEntity toEntity()=> DeleteTemplateEntity(
      success: success,
      message: message
  );

}
