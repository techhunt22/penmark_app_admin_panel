
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/settings/papertype/delete_papertype_entity.dart';
import '../../../repositories/settings/papertype/delete_papertype_repo.dart';

class DeletePaperTypeUseCase {
  final DeletePaperTypeRepository deletePaperTypeRepository;

  DeletePaperTypeUseCase (this.deletePaperTypeRepository);


  Future<Either<Failure, DeletePaperTypeEntity>> deletePaperTypeUseCase({required String id }) async {
    try {


      final result = await deletePaperTypeRepository.deletePaperTypeRepo(id: id);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}