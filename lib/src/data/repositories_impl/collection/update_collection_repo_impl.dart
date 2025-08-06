import 'package:coloring_app_admin_panel/src/data/datasource/collection/get_collections_datasource.dart';
import 'package:coloring_app_admin_panel/src/data/datasource/collection/update_collection_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/collection/get_collection_entities.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/collection/update_collection_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/collection/get_collection_repo.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/collection/update_collection_repo.dart';

class UpdateCollectionRepoImpl implements UpdateCollectionRepository{
  final UpdateCollectionDatasource updateCollectionDatasource;

  UpdateCollectionRepoImpl(this.updateCollectionDatasource);



  @override
  Future<UpdateCollectionEntity> updateCollectionRepo(UpdateCollectionParams params, String templateId, ) async {
    final updateCollections = await updateCollectionDatasource.updateCollection( params, templateId);


    return updateCollections.toEntity();
  }
}


