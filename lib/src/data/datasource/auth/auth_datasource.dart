import '../../models/auth/auth_model.dart';

abstract class AuthApiData {
  Future<AuthModel> login(String email, String password);
}

class AuthApiDataImpl implements AuthApiData {
  @override
  Future<AuthModel> login(String email, String password) async {
    throw UnimplementedError();
  }
}