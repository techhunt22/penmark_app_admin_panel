import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/settings/papertype/add_papertype_entity.dart';
import '../../../repositories/settings/papertype/add_papertype_repo.dart';


class AddPaperTypeUseCase {
  final AddPaperTypeRepository addPaperTypeRepository;

  AddPaperTypeUseCase (this.addPaperTypeRepository);


  Future<Either<Failure, AddPaperTypeEntity>> addPaperTypeUseCase({required String type,required String price}) async {
    try {

      if (type.isEmpty && price.isEmpty) {
        return Left(ValidationFailure("Fields are empty."));
      }
      if (type.isEmpty) {
        return Left(ValidationFailure("Type is empty."));
      }
      if (price.isEmpty) {
        return Left(ValidationFailure("Price is empty."));
      }

      final result = await addPaperTypeRepository.addPaperTypeRepo(type: type, price: price);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}