import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../data/datasource/template/add_template_datasource.dart';
import '../../entities/template/add_template_entity.dart';
import '../../repositories/template/add_template_repo.dart';

class AddTemplateUseCase {
  final AddTemplateRepository addTemplateRepository;

  AddTemplateUseCase(this.addTemplateRepository);

  Future<Either<Failure, AddTemplatesEntity>> templateUseCase(AddTemplateParams params) async {
    try {
      if (params.name.isEmpty) {
        return Left(ValidationFailure("Template name cannot be empty."));
      }
      if (params.status.isEmpty) {
        return Left(ValidationFailure("Status cannot be empty."));
      }
      if (params.collectionId.isEmpty) {
        return Left(ValidationFailure("Collection ID cannot be empty."));
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
      final result = await addTemplateRepository.addTemplateRepository(params);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString())); // Use existing error message
    }
  }


}
