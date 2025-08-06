class UpdateCollectionEntity {
  final bool success;
  final String message;
  final UpdateCollectionDataEntity data;

  UpdateCollectionEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class UpdateCollectionDataEntity {
  final String id;
  final String name;
  final int templatesCount;
  final String status;
  final DateTime createdAt;

  UpdateCollectionDataEntity({
    required this.id,
    required this.name,
    required this.templatesCount,
    required this.status,
    required this.createdAt,
  });

}
