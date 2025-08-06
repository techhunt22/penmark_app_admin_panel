// To parse this JSON data, do
//
//     final getChargesModel = getChargesModelFromJson(jsonString);

import 'dart:convert';

import '../../../../domain/entities/settings/charges/get_charges_entity.dart';

GetChargesModel getChargesModelFromJson(String str) => GetChargesModel.fromJson(json.decode(str));

String getChargesModelToJson(GetChargesModel data) => json.encode(data.toJson());

class GetChargesModel {
  final bool success;
  final String message;
  final List<Datum> data;

  GetChargesModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetChargesModel.fromJson(Map<String, dynamic> json) => GetChargesModel(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  GetChargesEntity toEntity()=> GetChargesEntity(
    success: success,
    message: message,
    data: data.map((x) => x.toEntity()).toList(),
  );


}

class Datum {
  final String id;
  final double tax;
  final double deliveryCharges;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.id,
    required this.tax,
    required this.deliveryCharges,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    tax: json["tax"]?.toDouble(),
    deliveryCharges: json["delivery_charges"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "tax": tax,
    "delivery_charges": deliveryCharges,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
  GetChargesDataEntity toEntity()=> GetChargesDataEntity(
      id: id,
      tax: tax,
      deliveryCharges: deliveryCharges,
      createdAt: createdAt

  );
}
