
import 'package:coloring_app_admin_panel/src/domain/entities/user/get_user_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/user/get_user_repo.dart';

import '../../datasource/users/get_users_datasource.dart';


class GetUsersRepoImpl implements GetUsersRepository{
  final GetUsersDatasource getUsersDatasource;

  GetUsersRepoImpl(this.getUsersDatasource);


  @override
  Future<GetUsersEntity> getUserRepo({required int page, required int limit}) async {
    final getTemplates = await getUsersDatasource.users(page: page, limit: limit);


    return getTemplates.toEntity();
  }

}