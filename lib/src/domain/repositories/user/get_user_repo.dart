
import 'package:coloring_app_admin_panel/src/domain/entities/user/get_user_entity.dart';



abstract class GetUsersRepository {
  Future<GetUsersEntity> getUserRepo({required int page, required int limit});
}
