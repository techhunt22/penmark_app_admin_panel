import 'package:coloring_app_admin_panel/src/domain/entities/template/get_templates_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../repositories/template/get_template_repo.dart';

class GetTemplatesUseCase {
  final GetTemplateRepository getTemplateRepository;

  GetTemplatesUseCase (this.getTemplateRepository);


  Future<Either<Failure, GetTemplatesEntity>> gettemplatesUseCase({required limit, required page}) async {
    try {


      final result = await getTemplateRepository.getTemplatesRepo(page: page, limit: limit);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}