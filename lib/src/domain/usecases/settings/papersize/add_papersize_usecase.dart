
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/settings/papersize/add_papersize_entity.dart';
import '../../../repositories/settings/papersize/add_papersize_repo.dart';


class AddPaperSizeUseCase {
  final AddPaperSizeRepository addPaperSizeRepository;

  AddPaperSizeUseCase (this.addPaperSizeRepository);


  Future<Either<Failure, AddPaperSizeEntity>> addPaperSizeUseCase({required String size,required String price}) async {
    try {

      if (size.isEmpty && price.isEmpty) {
        return Left(ValidationFailure("Fields are empty."));
      }
      if (size.isEmpty) {
        return Left(ValidationFailure("Size is empty."));
      }
      if (price.isEmpty) {
        return Left(ValidationFailure("Price is empty."));
      }

      final result = await addPaperSizeRepository.addPaperSizeRepo(size: size, price: price);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}