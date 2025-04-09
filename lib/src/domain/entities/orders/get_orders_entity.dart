class GetOrdersEntity {

  final List<OrdersDataEntity> orders;
  final GetOrdersPagination pagination;

  GetOrdersEntity({

    required this.orders,
    required this.pagination,
  });

}

class OrdersDataEntity {
  final String orderId;
  final String orderNumber;
  final DateTime createdAt;
  final String itemsOrdered;
  final int quantity;
  final String status;
  final double totalPrice;

  OrdersDataEntity({
    required this.orderId,
    required this.orderNumber,
    required this.createdAt,
    required this.itemsOrdered,
    required this.quantity,
    required this.status,
    required this.totalPrice,
  });

}

class GetOrdersPagination {
  final int totalItems;
  final int currentPage;
  final int totalPages;
  final int pageSize;

  GetOrdersPagination({
    required this.totalItems,
    required this.currentPage,
    required this.totalPages,
    required this.pageSize,
  });

}
