class DeletePaperTypeEntity {
  final bool success;
  final String message;
  final DeletePaperTypeDataEntity data;

  DeletePaperTypeEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class DeletePaperTypeDataEntity {
  final String id;
  final String type;
  final double price;
  final DateTime createdAt;

  DeletePaperTypeDataEntity({
    required this.id,
    required this.type,
    required this.price,
    required this.createdAt,
  });

}
