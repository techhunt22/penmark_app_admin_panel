class AuthEntity {
  bool success;
  String message;
  AuthEntityData data;

  AuthEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class AuthEntityData {
  String accessToken;
  String refreshToken;

  AuthEntityData({
    required this.accessToken,
    required this.refreshToken,
  });

}
