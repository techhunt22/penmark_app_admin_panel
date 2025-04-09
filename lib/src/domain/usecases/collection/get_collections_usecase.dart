import 'package:coloring_app_admin_panel/src/domain/entities/collection/get_collection_entities.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/collection/get_collection_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

class GetCollectionsUseCase {
  final GetCollectionRepository getCollectionRepository;

  GetCollectionsUseCase (this.getCollectionRepository);


  Future<Either<Failure, GetCollectionsEntity>> collectionsUseCase({required limit, required page}) async {
    try {


      final result = await getCollectionRepository.getCollectionRepo(page: page, limit: limit);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}