import 'package:coloring_app_admin_panel/src/domain/entities/template/delete_template_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/template/get_templates_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/template/delete_template_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../repositories/template/get_template_repo.dart';

class DeleteTemplateUseCase {
  final DeleteTemplateRepository deleteTemplateRepository;

  DeleteTemplateUseCase (this.deleteTemplateRepository);


  Future<Either<Failure, DeleteTemplateEntity>> deleteTemplateUseCase({required String templateId}) async {
    try {


      final result = await deleteTemplateRepository.deleteTemplateRepo(templateId: templateId);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}