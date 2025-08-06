
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/settings/papersize/get_papersize_entity.dart';
import '../../../repositories/settings/papersize/get_papersize_repo.dart';


class GetPaperSizeUseCase {
  final GetPaperSizeRepository getPaperSizeRepository;

  GetPaperSizeUseCase (this.getPaperSizeRepository);


  Future<Either<Failure, GetPaperSizeEntity>> getPaperSizeUseCase() async {
    try {


      final result = await getPaperSizeRepository.getPaperSizeRepo();
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}