


import 'package:coloring_app_admin_panel/src/data/datasource/collection/delete_collection_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/collection/delete_collection_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/collection/delete_collection_repo.dart';

class DeleteCollectionRepoImpl implements  DeleteCollectionRepository{
 final DeleteCollectionDatasource deleteCollectionDatasource  ;

 DeleteCollectionRepoImpl(this.deleteCollectionDatasource);

  @override
  Future<DeleteCollectionEntity> deleteCollectionRepo({required String templateId}) async {
    final deleteCollections = await deleteCollectionDatasource.deleteCollection(templateId: templateId);

    return deleteCollections.toEntity();

  }
}