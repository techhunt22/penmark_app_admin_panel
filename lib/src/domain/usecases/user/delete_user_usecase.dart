import 'package:coloring_app_admin_panel/src/domain/repositories/user/delete_user_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/user/delete_user_entity.dart';

class DeleteUserUseCase {
  final DeleteUserRepo deleteUserRepo;

  DeleteUserUseCase (this.deleteUserRepo);


  Future<Either<Failure, DeleteUserEntity>> deleteUsersUseCase({required userId}) async {
    try {


      final result = await deleteUserRepo.deleteUserRepo(userId: userId);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}