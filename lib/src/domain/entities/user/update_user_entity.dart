class UpdateUserEntity {
  final bool success;
  final String message;
  final UpdateUserDataEntity data;

  UpdateUserEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class UpdateUserDataEntity {
  final String id;
  final String fullname;
  final String email;
  final String status;

  UpdateUserDataEntity({
    required this.id,
    required this.fullname,
    required this.email,
    required this.status,
  });

}
