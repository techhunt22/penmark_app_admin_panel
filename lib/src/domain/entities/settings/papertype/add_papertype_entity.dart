class AddPaperTypeEntity {
  final bool success;
  final String message;
  final AddPaperTypeDataEntity data;

  AddPaperTypeEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class AddPaperTypeDataEntity {
  final String type;
  final double price;
  final String id;
  final DateTime createdAt;

  AddPaperTypeDataEntity({
    required this.type,
    required this.price,
    required this.id,
    required this.createdAt,
  });

}
