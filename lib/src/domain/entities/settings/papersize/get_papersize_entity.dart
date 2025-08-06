class GetPaperSizeEntity {
  final bool success;
  final String message;
  final List<GetPaperSizeDataEntity> data;

  GetPaperSizeEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class GetPaperSizeDataEntity {
  final String id;
  final String size;
  final double price;
  final DateTime createdAt;

  GetPaperSizeDataEntity({
    required this.id,
    required this.size,
    required this.price,
    required this.createdAt,
  });

}
