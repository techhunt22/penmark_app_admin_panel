import 'package:coloring_app_admin_panel/src/data/datasource/template/update_template_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/template/update_template_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/template/update_template_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../data/datasource/template/add_template_datasource.dart';
import '../../entities/template/add_template_entity.dart';
import '../../repositories/template/add_template_repo.dart';

class UpdateTemplateUseCase {
  final UpdateTemplateRepository updateTemplateRepository;

  UpdateTemplateUseCase(this.updateTemplateRepository);

  Future<Either<Failure, UpdateTemplateEntity>> updateTemplateUseCase(UpdateTemplateParams params,String id) async {
    try {


      if (params.fileBytes != null && params.fileName != null) {
        final fileExtension = params.fileName!.split('.').last.toLowerCase();
        if (fileExtension != 'svg') {
          return Left(ValidationFailure("Unsupported file format. Only SVG files are allowed."));
        }
      }

      // Call repository and return either Failure or Success
      final result = await updateTemplateRepository.updateTemplateRepository(params, id);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString())); // Use existing error message
    }
  }


}
