import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/settings/papertype/get_papertype_entity.dart';
import '../../../repositories/settings/papertype/get_papertype_repo.dart';


class GetPaperTypeUseCase {
  final GetPaperTypeRepository getPaperTypeRepository;

  GetPaperTypeUseCase (this.getPaperTypeRepository);


  Future<Either<Failure, GetPaperTypeEntity>> getPaperTypeUseCase() async {
    try {


      final result = await getPaperTypeRepository.getPaperTypeRepo();
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}