class UpdatePaperTypeEntity {
  final bool success;
  final String message;
  final UpdatePaperTypeDataEntity data;

  UpdatePaperTypeEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class UpdatePaperTypeDataEntity {
  final String id;
  final String type;
  final int price;
  final DateTime createdAt;


  UpdatePaperTypeDataEntity({
    required this.id,
    required this.type,
    required this.price,
    required this.createdAt,

  });

}
