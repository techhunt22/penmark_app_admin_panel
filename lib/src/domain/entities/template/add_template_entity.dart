import 'package:equatable/equatable.dart';

class AddTemplatesEntity extends Equatable{
  final bool success;
  final String message;
  final AddTemplatesEntityData data;

  const AddTemplatesEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  List<Object> get props => [success, message, data];

}

class AddTemplatesEntityData extends Equatable {
  final String name;
  final String collectionname;
  final String svgImage;
  final String status;
  final String id;


  const AddTemplatesEntityData({
    required this.name,
    required this.collectionname,
    required this.svgImage,
    required this.status,
    required this.id,

  });
  @override
  List<Object> get props => [name, collectionname, svgImage, status, id];

}
