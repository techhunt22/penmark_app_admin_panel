
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/settings/papersize/update_papersize_entity.dart';
import '../../../repositories/settings/papersize/update_papersize_repo.dart';


class UpdatePaperSizeUseCase {
  final UpdatePaperSizeRepository updatePaperSizeRepository;

  UpdatePaperSizeUseCase (this.updatePaperSizeRepository);


  Future<Either<Failure, UpdatePaperSizeEntity>> updatePaperSizeUseCase({
    required String id,
    String? size,
    String? price,

  }) async {
    try {


      final result = await updatePaperSizeRepository.updatePaperSizeRepo(size: size, price: price, id: id);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}