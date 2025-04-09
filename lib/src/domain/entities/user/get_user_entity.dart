class GetUsersEntity {

  List<GetUsersDataEntity> data;
  GetUserPaginationEntity pagination;

  GetUsersEntity({
    required this.data,
    required this.pagination,
  });

}

class GetUsersDataEntity {
  String id;
  String fullname;
  String email;
  String status;
  DateTime createdAt;
  String phone;

  GetUsersDataEntity({
    required this.id,
    required this.fullname,
    required this.email,
    required this.status,
    required this.createdAt,
    required this.phone,
  });

}

class GetUserPaginationEntity {
  int totalItems;
  int currentPage;
  int totalPages;
  int pageSize;

  GetUserPaginationEntity({
    required this.totalItems,
    required this.currentPage,
    required this.totalPages,
    required this.pageSize,
  });

}
