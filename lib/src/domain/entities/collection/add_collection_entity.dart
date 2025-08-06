class AddCollectionEntity {
  final bool success;
  final String message;
  final AddCollectionDataEntity data;

  AddCollectionEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class AddCollectionDataEntity {
  final String name;
  final int templatesCount;
  final String status;
  final String admin;
  final String id;
  final DateTime createdAt;

  AddCollectionDataEntity({
    required this.name,
    required this.templatesCount,
    required this.status,
    required this.admin,
    required this.id,
    required this.createdAt,
  });

}
