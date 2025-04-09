class GetTemplatesEntity {

  final List<GetTemplatesDataEntity> data;
  final GetTemplatesPaginationEntity pagination;

  GetTemplatesEntity({

    required this.data,
    required this.pagination,
  });

}

class GetTemplatesDataEntity {
  final String id;
  final String name;
  final String collectionname;
  final String svgImage;
  final String status;
  final DateTime createdAt;

  GetTemplatesDataEntity({
    required this.id,
    required this.name,
    required this.collectionname,
    required this.svgImage,
    required this.status,
    required this.createdAt,
  });

}

class GetTemplatesPaginationEntity {
  final int totalItems;
  final int currentPage;
  final int totalPages;
  final int pageSize;

  GetTemplatesPaginationEntity({
    required this.totalItems,
    required this.currentPage,
    required this.totalPages,
    required this.pageSize,
  });

}
