import 'package:coloring_app_admin_panel/src/data/datasource/collection/update_collection_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/collection/update_collection_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/collection/update_collection_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

class UpdateCollectionUseCase {
  final UpdateCollectionRepository updateCollectionRepository;

  UpdateCollectionUseCase(this.updateCollectionRepository);

  Future<Either<Failure, UpdateCollectionEntity>> updateCollectionUseCase(UpdateCollectionParams params,String id) async {
    try {


      if (params.fileBytes != null && params.fileName != null) {
        final fileExtension = params.fileName!.split('.').last.toLowerCase();
        if (fileExtension != 'svg') {
          return Left(ValidationFailure("Unsupported file format. Only SVG files are allowed."));
        }
      }

      // Call repository and return either Failure or Success
      final result = await updateCollectionRepository.updateCollectionRepo(params, id);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString())); // Use existing error message
    }
  }


}
