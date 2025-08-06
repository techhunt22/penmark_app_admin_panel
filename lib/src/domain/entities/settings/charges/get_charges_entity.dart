class GetChargesEntity {
  final bool success;
  final String message;
  final List<GetChargesDataEntity> data;

  GetChargesEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class GetChargesDataEntity {
  final String id;
  final double tax;
  final double deliveryCharges;
  final DateTime createdAt;


  GetChargesDataEntity({
    required this.id,
    required this.tax,
    required this.deliveryCharges,
    required this.createdAt,

  });





}
