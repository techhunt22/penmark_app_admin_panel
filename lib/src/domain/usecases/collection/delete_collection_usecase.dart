import 'package:coloring_app_admin_panel/src/domain/entities/collection/delete_collection_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/template/delete_template_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/template/get_templates_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/collection/delete_collection_repo.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/template/delete_template_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

class DeleteCollectionUseCase {
  final DeleteCollectionRepository deleteCollectionRepository;

  DeleteCollectionUseCase (this.deleteCollectionRepository);


  Future<Either<Failure, DeleteCollectionEntity>> deleteCollectionUseCase({required String templateId}) async {
    try {


      final result = await deleteCollectionRepository.deleteCollectionRepo(templateId: templateId);
      return Right(result);

    } catch (e) {

      return Left(ServerFailure(e.toString()));

    }

  }

}