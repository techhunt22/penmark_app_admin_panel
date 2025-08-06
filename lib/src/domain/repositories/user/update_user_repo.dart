
import 'package:coloring_app_admin_panel/src/domain/entities/user/get_user_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/user/update_user_entity.dart';



abstract class UpdateUserRepository {
  Future<UpdateUserEntity> updateUserRepo({required String userId, required String status });
}
