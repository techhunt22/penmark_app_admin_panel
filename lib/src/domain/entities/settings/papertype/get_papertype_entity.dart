class GetPaperTypeEntity {
  final bool success;
  final String message;
  final List<GetPaperTypeDataEntity> data;

  GetPaperTypeEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class GetPaperTypeDataEntity {
  final String id;
  final String type;
  final double price;
  final DateTime createdAt;

  GetPaperTypeDataEntity({
    required this.id,
    required this.type,
    required this.price,
    required this.createdAt,
  });

}
