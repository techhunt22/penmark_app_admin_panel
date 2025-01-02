class AuthEntity {
  bool success;
  String message;
  AuthData data;

  AuthEntity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class AuthData {
  String accessToken;
  String refreshToken;

  AuthData({
    required this.accessToken,
    required this.refreshToken,
  });

}
