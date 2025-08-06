class UpdatePaperSizeEntity {
  final bool success;
  final String message;
  final UpdatePaperSizeDataEntity data;

  UpdatePaperSizeEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class UpdatePaperSizeDataEntity {
  final String id;
  final String size;
  final double price;
  final DateTime createdAt;

  UpdatePaperSizeDataEntity({
    required this.id,
    required this.size,
    required this.price,
    required this.createdAt,
  });

}
