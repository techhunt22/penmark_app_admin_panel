import 'package:coloring_app_admin_panel/src/data/datasource/collection/add_collection_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/collection/add_collection_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/collection/add_collection_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../data/datasource/template/add_template_datasource.dart';
import '../../entities/template/add_template_entity.dart';
import '../../repositories/template/add_template_repo.dart';

class AddCollectionUseCase {
  final AddCollectionRepository addCollectionRepository;

  AddCollectionUseCase(this.addCollectionRepository);

  Future<Either<Failure, AddCollectionEntity>> collectionUseCase(AddCollectionParams params) async {
    try {
      if (params.name.isEmpty) {
        return Left(ValidationFailure("Collection name cannot be empty."));
      }
      if (params.status.isEmpty) {
        return Left(ValidationFailure("Status cannot be empty."));
      }
      if (params.fileBytes.isEmpty) {
        return Left(ValidationFailure("File does not exist."));
      }

      String allowedExtensions = 'svg';
      String fileExtension = params.fileName.split('.').last.toLowerCase();

      if (!allowedExtensions.contains(fileExtension)) {
        return Left(ValidationFailure("Unsupported file format. Only SVGs are allowed."));
      }

      // Call repository and return either Failure or Success
      final result = await addCollectionRepository.addCollectionRepo(params);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString())); // Use existing error message
    }
  }


}
