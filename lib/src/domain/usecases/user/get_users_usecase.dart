import 'package:coloring_app_admin_panel/src/domain/entities/user/get_user_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/user/get_user_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

class GetUsersUseCase {
  final GetUsersRepository getUsersRepository;

  GetUsersUseCase (this.getUsersRepository);


  Future<Either<Failure, GetUsersEntity>> getUsersUseCase({required limit, required page}) async {
    try {


      final result = await getUsersRepository.getUserRepo(page: page, limit: limit);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}