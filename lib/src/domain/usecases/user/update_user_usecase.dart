import 'package:coloring_app_admin_panel/src/domain/entities/user/get_user_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/user/update_user_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/user/get_user_repo.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/user/update_user_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

class UpdateUserUseCase {
  final UpdateUserRepository updateUserRepository;

  UpdateUserUseCase (this.updateUserRepository);


  Future<Either<Failure, UpdateUserEntity>> updateUserUseCase({required String userId, required String status }) async {
    try {

      final result = await updateUserRepository.updateUserRepo(userId: userId,status: status);

      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}