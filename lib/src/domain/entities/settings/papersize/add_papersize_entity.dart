class AddPaperSizeEntity {
  final bool success;
  final String message;
  final AddPaperSizeDataEntity data;

  AddPaperSizeEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class AddPaperSizeDataEntity {
  final String size;
  final double price;
  final String id;
  final DateTime createdAt;

  AddPaperSizeDataEntity({
    required this.size,
    required this.price,
    required this.id,
    required this.createdAt,
  });

}
