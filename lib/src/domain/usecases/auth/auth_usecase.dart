import 'package:coloring_app_admin_panel/src/domain/entities/auth/auth_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/auth/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  Future<AuthEntity> login(String email, String password) async {
    // Use case retrieves entities (not models) from the repository
    return await authRepository.login(email,password);
  }
}
