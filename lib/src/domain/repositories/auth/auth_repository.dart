
import '../../entities/auth/auth_entity.dart';


abstract class AuthRepository {
  Future<AuthEntity> loginRepository(String email, String password);
}
