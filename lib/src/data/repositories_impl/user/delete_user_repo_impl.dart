
import 'package:coloring_app_admin_panel/src/data/datasource/users/delete_user_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/user/delete_user_repo.dart';

import '../../../domain/entities/user/delete_user_entity.dart';


class DeleteUserRepoImpl implements DeleteUserRepo{
  final DeleteUserDatasource deleteUserDatasource;

  DeleteUserRepoImpl(this.deleteUserDatasource);

  @override
  Future<DeleteUserEntity> deleteUserRepo({required String userId}) async {
    final deleteUser = await deleteUserDatasource.deleteUser(userId:userId);


    return deleteUser.toEntity();
  }

}