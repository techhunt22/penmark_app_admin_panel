
import 'package:coloring_app_admin_panel/src/data/datasource/users/update_user_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/user/update_user_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/user/update_user_repo.dart';



class UpdateUserRepoImpl implements UpdateUserRepository{
  final UpdateUserDatasource updateUserDatasource;

  UpdateUserRepoImpl(this.updateUserDatasource);



  @override
  Future<UpdateUserEntity> updateUserRepo({required String userId, required String status}) async {
    final updateUser = await updateUserDatasource.updateUsers(status: status,userId: userId);


    return updateUser.toEntity();
  }

}