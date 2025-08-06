

import 'dart:convert';

import '../../../domain/entities/user/delete_user_entity.dart';

DeleteUserModel deleteUserModelFromJson(String str) => DeleteUserModel.fromJson(json.decode(str));

String deleteUserModelToJson(DeleteUserModel data) => json.encode(data.toJson());

class DeleteUserModel {
  final bool success;
  final String message;

  DeleteUserModel({
    required this.success,
    required this.message,
  });

  factory DeleteUserModel.fromJson(Map<String, dynamic> json) => DeleteUserModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };


  DeleteUserEntity toEntity()=> DeleteUserEntity(
      success: success,
      message: message
  );



}
