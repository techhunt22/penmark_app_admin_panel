class GetCollectionsEntity {

  final List<GetCollectionDataEntity> data;
  final PaginationEntity pagination;

  GetCollectionsEntity({

    required this.data,
    required this.pagination,

  });

}

class GetCollectionDataEntity {
  final String id;
  final String name;
  final int templatesCount;
//  final String coverImage;
  final String status;
  final String admin;
  final DateTime createdAt;

  GetCollectionDataEntity({
    required this.id,
    required this.name,
    required this.templatesCount,
  //  required this.coverImage,
    required this.status,
    required this.admin,
    required this.createdAt,
  });

}

class PaginationEntity {
  final int totalItems;
  final int currentPage;
  final int totalPages;
  final int pageSize;

  PaginationEntity({
    required this.totalItems,
    required this.currentPage,
    required this.totalPages,
    required this.pageSize,
  });

}