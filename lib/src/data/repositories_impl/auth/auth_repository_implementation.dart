
import '../../../domain/entities/auth/auth_entity.dart';
import '../../../domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<AuthEntity> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
