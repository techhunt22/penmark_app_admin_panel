class UpdateTemplateEntity {
  final bool success;
  final String message;
  final UpdateTemplateEntityData data;

  UpdateTemplateEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class UpdateTemplateEntityData {
  final String id;
  final String name;
  final String collectionname;
  final String svgImage;
  final String status;
  final DateTime createdAt;

  UpdateTemplateEntityData({
    required this.id,
    required this.name,
    required this.collectionname,
    required this.svgImage,
    required this.status,
    required this.createdAt,
  });

}
