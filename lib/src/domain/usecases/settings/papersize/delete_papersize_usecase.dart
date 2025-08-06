
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/settings/papersize/delete_papersize_entity.dart';
import '../../../repositories/settings/papersize/delete_papersize_repo.dart';

class DeletePaperSizeUseCase {
  final DeletePaperSizeRepository deletePaperSizeRepository;

  DeletePaperSizeUseCase (this.deletePaperSizeRepository);


  Future<Either<Failure, DeletePaperSizeEntity>> deletePaperSizeUseCase({required String id }) async {
    try {


      final result = await deletePaperSizeRepository.deletePaperSizeRepo(id: id);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}