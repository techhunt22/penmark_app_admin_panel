// To parse this JSON data, do
//
//     final getOrdersModel = getOrdersModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/orders/get_orders_entity.dart';

GetOrdersModel getOrdersModelFromJson(String str) => GetOrdersModel.fromJson(json.decode(str));

String getOrdersModelToJson(GetOrdersModel data) => json.encode(data.toJson());

class GetOrdersModel {
  final bool success;
  final String message;
  final List<Order> orders;
  final Pagination pagination;

  GetOrdersModel({
    required this.success,
    required this.message,
    required this.orders,
    required this.pagination,
  });

  factory GetOrdersModel.fromJson(Map<String, dynamic> json) => GetOrdersModel(
    success: json["success"],
    message: json["message"],
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };

  GetOrdersEntity toEntity() => GetOrdersEntity(
      orders: orders.map((x) => x.toEntity()).toList(),
      pagination:  pagination.toEntity()
  );


}

class Order {
  final String orderId;
  final String orderNumber;
  final DateTime createdAt;
  final String itemsOrdered;
  final int quantity;
  final String status;
  final double totalPrice;

  Order({
    required this.orderId,
    required this.orderNumber,
    required this.createdAt,
    required this.itemsOrdered,
    required this.quantity,
    required this.status,
    required this.totalPrice,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["orderId"],
    orderNumber: json["orderNumber"],
    createdAt: DateTime.parse(json["createdAt"]),
    itemsOrdered: json["itemsOrdered"],
    quantity: json["quantity"],
    status: json["status"],
    totalPrice: json["totalPrice"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "orderNumber": orderNumber,
    "createdAt": createdAt.toIso8601String(),
    "itemsOrdered": itemsOrdered,
    "quantity": quantity,
    "status": status,
    "totalPrice": totalPrice,
  };

  OrdersDataEntity toEntity() => OrdersDataEntity(
    orderId: orderId,
    orderNumber: orderNumber,
    itemsOrdered: itemsOrdered,
    quantity: quantity,
    totalPrice: totalPrice,
    status: status,
    createdAt: createdAt,


  );

}

class Pagination {
  final int totalItems;
  final int currentPage;
  final int totalPages;
  final int pageSize;

  Pagination({
    required this.totalItems,
    required this.currentPage,
    required this.totalPages,
    required this.pageSize,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalItems: json["totalItems"],
    currentPage: json["currentPage"],
    totalPages: json["totalPages"],
    pageSize: json["pageSize"],
  );

  Map<String, dynamic> toJson() => {
    "totalItems": totalItems,
    "currentPage": currentPage,
    "totalPages": totalPages,
    "pageSize": pageSize,
  };

  GetOrdersPagination toEntity() => GetOrdersPagination(
    totalItems: totalItems,
    currentPage: currentPage,
    totalPages: totalPages,
    pageSize: pageSize,


  );

}
