

import '../../entities/user/delete_user_entity.dart';



abstract class DeleteUserRepo {
  Future<DeleteUserEntity> deleteUserRepo({required String userId});
}
