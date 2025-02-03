
import '../../../domain/entities/auth/auth_entity.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../datasource/auth/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiData authApiData;

  AuthRepositoryImpl(this.authApiData);
  @override
  Future<AuthEntity> loginRepository(String email, String password) async {
    final authModel = await authApiData.login(email, password);

    // Map AuthModel to AuthEntity
    final authEntity = AuthEntity(
      success: authModel.success,
      message: authModel.message,
      data: AuthEntityData(
        accessToken: authModel.data.accessToken,
        refreshToken: authModel.data.refreshToken,
      ),
    );

    return authEntity;
  }
}
