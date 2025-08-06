
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/settings/papertype/update_papertype_entity.dart';
import '../../../repositories/settings/papertype/update_papertype_repo.dart';



class UpdatePaperTypeUseCase {
  final UpdatePaperTypeRepository updatePaperTypeRepository;

  UpdatePaperTypeUseCase (this.updatePaperTypeRepository);


  Future<Either<Failure, UpdatePaperTypeEntity>> updatePaperTypeUseCase({
    required String id,
    String? type,
    String? price,

  }) async {
    try {


      final result = await updatePaperTypeRepository.updatePaperTypeRepo(type: type, price: price, id: id);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}