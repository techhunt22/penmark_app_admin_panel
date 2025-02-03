import 'package:coloring_app_admin_panel/src/domain/entities/auth/auth_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/auth/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  Future<AuthEntity> loginCall(String email, String password) async {
    email = email.trim();
    password = password.trim();

    if (email.isEmpty) {
      throw Exception('Email must not be empty.');
    }
    if (!email.contains('@')) {
      throw Exception('Invalid email format.');
    }
    if (password.isEmpty) {
      throw Exception('Password must not be empty.');
    }

    // Use case retrieves entities (not models) from the repository
    final authEntity = await authRepository.loginRepository(email, password);
    return authEntity;  // Return the AuthEntity on success
  }
}
