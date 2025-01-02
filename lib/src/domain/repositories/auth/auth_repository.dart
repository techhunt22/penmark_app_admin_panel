
import '../../entities/auth/auth_entity.dart';


abstract class AuthRepository {
  Future<AuthEntity> login(String email, String password);
}
